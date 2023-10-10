class Folder < ApplicationRecord
  belongs_to :holder, polymorphic: true
  belongs_to :property, foreign_key: :holder_id, class_name: 'Properties::Folder', dependent: :destroy, inverse_of: :value, optional: true
  has_one :direct_schema, as: :holder, class_name: 'Schema', dependent: :destroy
  has_many :items, dependent: :destroy

  def schema
    # TODO - Check if this works propertly once the Properties::Folder will be implemented
    if holder_type == "Properties::Folder"
      holder.field.schema
    else
      direct_schema
    end
  end
end
