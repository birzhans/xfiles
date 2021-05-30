class Room < ApplicationRecord
  has_many :messages, dependent: :destroy

  belongs_to :client
  belongs_to :aide

  validates :client, uniqueness: { scope: [:aide] }
end
