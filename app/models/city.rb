class City < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :locations
  has_many :users, through: :locations
end
