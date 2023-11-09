class Properties::Datetime < ApplicationRecord
  belongs_to :item
  belongs_to :field

  def completed?
    value.present?
  end
end
