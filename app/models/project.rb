class Project < ApplicationRecord
  has_many :folders, as: :holder, dependent: :destroy, inverse_of: :project
end
