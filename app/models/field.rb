class Field < ApplicationRecord
  belongs_to :schema
  has_many :date_properties, class_name: 'Properties::Date', dependent: :destroy
  enum kind: {
    date: 1
  }
end
