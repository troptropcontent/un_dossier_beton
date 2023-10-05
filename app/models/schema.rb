class Schema < ApplicationRecord
  belongs_to :holder, polymorphic: true
end
