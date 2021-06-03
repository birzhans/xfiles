class Rating < ApplicationRecord
  belongs_to :aide
  belongs_to :client

  validates :value, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :client, uniqueness: { scope: :aide }
end
