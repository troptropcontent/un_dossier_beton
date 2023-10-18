class Properties::Date < ApplicationRecord
  belongs_to :item
  belongs_to :field

  def completed?
    value.present?
  end
end
