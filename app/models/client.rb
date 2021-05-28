class Client < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :locations, as: :userable, dependent: :destroy
  has_many :cities, through: :locations
end
