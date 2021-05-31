class FavouriteAide < ApplicationRecord
  belongs_to :client
  belongs_to :aide
end
