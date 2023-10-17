class Field < ApplicationRecord
  belongs_to :schema
  has_one :children_schema, class_name: 'Schema', as: :holder

  # Properties
  has_many :date_properties, class_name: 'Properties::Date', dependent: :destroy
  has_many :currency_properties, class_name: 'Properties::Currency', dependent: :destroy 
  has_many :folder_properties, class_name: 'Properties::Folder', dependent: :destroy 
  has_many :document_properties, class_name: 'Properties::Document', dependent: :destroy 

  # Configurations
  has_one :aggregate_configuration, class_name: 'Configurations::Aggregate', dependent: :destroy   

  # TODO Validates association of a config if configurable?

  enum kind: {
    date: 1,
    currency: 2,
    folder: 3,
    document: 4,
    aggregate: 5,
  }

  def property_class
    "Properties::#{kind.camelize}".constantize
  end

  def configuration_class
    "Configurations::#{kind.camelize}".constantize
  end
end
