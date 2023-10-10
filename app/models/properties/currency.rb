class Properties::Currency < ApplicationRecord
  monetize :value_cents
  belongs_to :item
  belongs_to :field
end
