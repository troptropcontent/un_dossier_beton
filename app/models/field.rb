class Field < ApplicationRecord
  belongs_to :schema
  has_one :children_schema, class_name: 'Schema', as: :holder, dependent: :destroy
  
  # Properties
  has_many :date_properties, class_name: 'Properties::Date', dependent: :destroy
  has_many :currency_properties, class_name: 'Properties::Currency', dependent: :destroy 
  has_many :folder_properties, class_name: 'Properties::Folder', dependent: :destroy 
  has_many :document_properties, class_name: 'Properties::Document', dependent: :destroy 
  has_many :datetime_properties, class_name: 'Properties::Datetime', dependent: :destroy 
  
  # Configurations
  has_one :aggregate_configuration, class_name: 'Configurations::Aggregate', dependent: :destroy 
  has_many :aggregate_configuration_field_to_aggregates, class_name: 'Configurations::Aggregate', dependent: :destroy, foreign_key: :field_to_aggregate_id  
  

  before_create :set_index!

  # Validates the uniqueness of the index per holder

  # TODO Validates association of a config if configurable?

  # TODO Validates that an Aggregate field can not be required

  enum kind: {
    date: 1,
    currency: 2,
    folder: 3,
    document: 4,
    aggregate: 5,
    datetime: 6,
  }

  def property_class
    "Properties::#{kind.camelize}".constantize
  end

  def configuration_class
    "Configurations::#{kind.camelize}".constantize
  end

  def reposition(new_index)
   # TODO Create a reposition logic here that will place the item at the new index and offset all the following
  end

  private

  def set_index!
    return 0 if (already_existing_fields = self.schema.fields) && already_existing_fields.empty?
    next_index = already_existing_fields.order(index: :desc).pick(:index) + 1 
    self.index = next_index
  end
end
