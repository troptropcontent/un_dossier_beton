class Field < ApplicationRecord
  belongs_to :schema
  enum kind: {
    date: 1
  }
end
