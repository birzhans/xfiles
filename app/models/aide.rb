class Aide < ApplicationRecord
  include Filterable

  belongs_to :user

  has_many :favourite_aides
  has_many :clients, through: :favourite_aides

  has_many :skills
  has_many :categories, through: :skills

  has_many :requests

  scope :filter_by_category, -> (category_id) { joins(:categories).where('categories.id = ?', category_id) }
  scope :filter_by_city, -> (city_id) { includes(user: :cities).where(user: { cities: {id: city_id} }) }

  def username
    user.username
  end
end
