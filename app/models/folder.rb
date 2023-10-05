class Folder < ApplicationRecord
  belongs_to :holder, polymorphic: true
  has_one :direct_schema, as: :holder, class_name: 'Schema', dependent: :destroy
  has_many :items, dependent: :destroy
end
