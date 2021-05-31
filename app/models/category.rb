class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :skills
  has_many :aides, through: :skills
end
