class Properties::Document < ApplicationRecord
  belongs_to :item
  belongs_to :field
  has_one_attached :file
end
