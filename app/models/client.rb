class Client < ApplicationRecord
  belongs_to :user

  has_many :favourite_aides
  has_many :aides, through: :favourite_aides
end
