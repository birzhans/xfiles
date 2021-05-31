class Aide < ApplicationRecord
  belongs_to :user

  has_many :favourite_aides
  has_many :clients, through: :favourite_aides

  has_many :skills
  has_many :categories, through: :skills
end
