class Field < ApplicationRecord
  belongs_to :schema
  has_many :date_properties, class_name: 'Properties::Date', dependent: :destroy
  has_many :currency_properties, class_name: 'Properties::Currency', dependent: :destroy 
  enum kind: {
    date: 1,
    currency: 2,
  }

  def property_class
    "Properties::#{kind.camelize}".constantize
  end
end
