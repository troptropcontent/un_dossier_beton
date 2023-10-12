class Folder < ApplicationRecord
  has_one :direct_schema, as: :holder, class_name: 'Schema', dependent: :destroy
  has_many :items, dependent: :destroy
  belongs_to :holder, polymorphic: true
  belongs_to :property, -> {where(folders: { holder_type: "Properties::Folder" }) }, foreign_key: :holder_id, class_name: 'Properties::Folder', inverse_of: :value, optional: true
  belongs_to :project, -> {where(folders: { holder_type: "Project" }) }, foreign_key: :holder_id, class_name: "Project", inverse_of: :folders, optional: true
  

  def schema
    # TODO - Check if this works propertly once the Properties::Folder will be implemented
    if holder_type == "Properties::Folder"
      holder.field.schema
    else
      direct_schema
    end
  end
end
