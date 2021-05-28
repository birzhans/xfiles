class City < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :locations, dependent: :destroy
  has_many :users, through: :locations
end
