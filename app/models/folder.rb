class Folder < ApplicationRecord
  belongs_to :holder, polymorphic: true
end
