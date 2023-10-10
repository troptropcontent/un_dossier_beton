class Item < ApplicationRecord
  belongs_to :folder
  has_many :date_properties, class_name: 'Properties::Date', dependent: :destroy 
  has_many :currency_properties, class_name: 'Properties::Currency', dependent: :destroy 

  def properties
    folder.schema.fields.map {|field|
      field.property_class.find_or_initialize_by(field: field, item: self)
    }
  end
end
