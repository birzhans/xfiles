class Aide < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 validates :name, presence: true
 validates :username, presence: true, uniqueness: true

 has_many :locations, as: :userable, dependent: :destroy
 has_many :cities, through: :locations

 has_many :starred_aides
 has_many :clients, through: :starred_aides

 has_many :messages, as: :userable
 has_many :rooms

 has_many :aide_categories
 has_many :categories, -> { order('categories.name') }, through: :aide_categories

 def profile_path
   '/aides/profile'
 end

 def self.get_by_city(city_id)
   Aide.joins(:cities).where('cities.id = ?', city_id)
 end

 def self.get_by_category(aides, category_id)
   aides.joins(:categories).where('categories.id = ?', category_id)
 end

 def self.search(city_id, category_id)
   if city_id != nil && city_id != 'All'
     aides = Aide.get_by_city(city_id)
   else
     aides = Aide.all
   end

   if category_id != nil && category_id != 'All'
     aides = Aide.get_by_category(aides, category_id)
   end

   return aides
 end
end
