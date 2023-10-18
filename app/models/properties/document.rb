class Properties::Document < ApplicationRecord
  belongs_to :item
  belongs_to :field
  has_one_attached :file

  def value
    file.blob.filename.to_s
  end

  def completed?
    file.present?
  end
end
