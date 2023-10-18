class Item < ApplicationRecord
  belongs_to :folder
  has_many :date_properties, class_name: 'Properties::Date', dependent: :destroy 
  has_many :currency_properties, class_name: 'Properties::Currency', dependent: :destroy 
  has_many :folder_properties, class_name: 'Properties::Folder', dependent: :destroy 
  has_many :document_properties, class_name: 'Properties::Document', dependent: :destroy 

  def properties(required_only: false)
    fields = folder.schema.fields.order(:index)
    fields = fields.where(required: true) if required_only
    fields.map {|field|
      field.property_class.find_or_initialize_by(field: field, item: self)
    }
  end

  def status
    # TODO Put here a method that return either to_complete | completed | approved
    @status ||= %i[to_complete completed approved].sample
  end

  def completed?
    properties(required_only: true).all?(&:completed?)
  end
end
