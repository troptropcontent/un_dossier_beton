class Schema < ApplicationRecord
  belongs_to :holder, polymorphic: true
  has_many :fields, dependent: :destroy
end
