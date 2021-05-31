class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :client
  has_one :aide

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true

  has_many :locations
  has_many :cities, through: :locations

  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'

  has_many :messages, dependent: :destroy
end
