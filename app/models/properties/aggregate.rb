module Properties
  class Aggregate 
    def self.find_or_initialize_by(field: , item: )
      new(field: , item: )
    end
  
    attr_reader :field, :item
  
    def initialize(field: nil, field_id: nil, item: nil, item_id: nil)
        @field = field || Field.find_by(field_id)
        @field_id = @field.id
        @item = item || Item.find(item_id_id)
        @item_id = @item.id
    end
  
    def value
      properties.sum{|property| property.value}
    end
    
    def to_partial_path
      "properties/aggregates/aggregate"
    end

    def completed?
      true
    end

    private
  
    def field_to_aggregate
      @field_to_aggregate ||= field.aggregate_configuration.field_to_aggregate
    end

    def subfolder
      @subfolder ||= Properties::Folder.find_by(field: folder_field, item: item)&.value
    end

    def folder_field
      @folder_field ||= field_to_aggregate.schema.holder
    end

    def properties 
      @properties ||= field_to_aggregate.property_class.joins(:item)
                                                       .where(field: field_to_aggregate, 
                                                              item: {folder_id: subfolder.id}
                                                       )
    end
  end
end
