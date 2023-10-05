class Project < ApplicationRecord
  has_many :folders, as: :holder, dependent: :destroy
end
