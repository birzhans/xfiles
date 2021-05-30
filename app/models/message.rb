class Message < ApplicationRecord
  belongs_to :room
  belongs_to :userable, polymorphic: true

  validates :content, presence: true
end
