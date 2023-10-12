class Folder < ApplicationRecord
  has_one :direct_schema, as: :holder, class_name: 'Schema', dependent: :destroy
  has_many :items, dependent: :destroy
  belongs_to :holder, polymorphic: true

  scope :holded_by_property, -> { where(holder_type: "Properties::Folder")}
  scope :holded_by_project, -> { where(holder_type: "Project")}
  
  belongs_to :property, foreign_key: :holder_id, class_name: 'Properties::Folder', inverse_of: :value, optional: true
  belongs_to :project, foreign_key: :holder_id, class_name: "Project", inverse_of: :folders, optional: true
  

  def schema
    # TODO - Check if this works propertly once the Properties::Folder will be implemented
    if holder_type == "Properties::Folder"
      holder.field.schema
    else
      direct_schema
    end
  end
end
