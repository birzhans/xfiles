class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :aide_categories
  has_many :aides, through: :aide_categories
end
