class Location < ApplicationRecord
  belongs_to :userable, polymorphic: true
  belongs_to :city
end
