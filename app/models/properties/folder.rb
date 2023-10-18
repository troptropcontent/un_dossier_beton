class Properties::Folder < ApplicationRecord
  belongs_to :item
  belongs_to :field
  has_one :value, -> { holded_by_property }, class_name: "::Folder", dependent: :destroy, inverse_of: :property, foreign_key: :holder_id
  after_create :create_folder!

  def completed?
    value&.items.all?(&:completed?)
  end

  private

  def create_folder!
    Folder.create!(holder: self)
  end
end
