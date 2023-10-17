module Configurations
  class Aggregate < ApplicationRecord
    belongs_to :field
    belongs_to :field_to_aggregate, class_name: 'Field'
  
    # TODO Create a validation that only allow field_to_aggregate_id if it belongs to a subfolder of field's schema, the field needs to belong to a field that belong to a schema that belongs to the field folder
    # we also only wants agregable fields type to be here
  end
end
