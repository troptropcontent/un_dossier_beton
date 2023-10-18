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
    return :to_complete unless completed?
    approved? ? :approved : :completed
  end

  def completed?
    properties(required_only: true).all?(&:completed?)
  end

  def approved?
    # TODO Implement a system of review here 
    true
  end
end
