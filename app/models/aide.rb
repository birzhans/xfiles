class Aide < ApplicationRecord
  include Filterable

  belongs_to :user

  has_many :favourite_aides
  has_many :clients, through: :favourite_aides

  has_many :skills
  has_many :categories, through: :skills

  has_many :requests
  has_many :ratings

  scope :filter_by_category, -> (category_id) { joins(:categories).where('categories.id = ?', category_id) }
  scope :filter_by_city, -> (city_id) { includes(user: :cities).where(user: { cities: {id: city_id} }) }

  def username
    user.username
  end

  def rating
    c = ratings.count
    if c != 0
      rating = 0
      ratings.each do |r|
        rating += r.value
      end
      rating /= c.to_f
      "#{rating.round(2)} (#{c} votes)"
    else
      '0 votes'
    end
  end
end
