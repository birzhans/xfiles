class Client < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :locations, as: :userable, dependent: :destroy
  has_many :cities, through: :locations

  has_many :starred_aides
  has_many :aides, through: :starred_aides

  def profile_path
    '/clients/profile'
  end
end
