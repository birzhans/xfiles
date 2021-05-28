class Aide < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 validates :name, presence: true

 has_many :locations, as: :userable, dependent: :destroy
 has_many :cities, through: :locations

 def profile_path
   '/aides/profile'
 end

 def self.get_by_city(city_id)
   Aide.joins(:cities).where('cities.id = ?', city_id)
 end
end
