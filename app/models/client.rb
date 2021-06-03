class Client < ApplicationRecord
  belongs_to :user

  has_many :favourite_aides
  has_many :aides, through: :favourite_aides

  has_many :requests

  def username
    user.username
  end
end
