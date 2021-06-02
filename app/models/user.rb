class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :client
  has_one :aide

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: [0, 1] }

  has_many :locations
  has_many :cities, through: :locations

  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'

  has_many :messages, dependent: :destroy

  scope :clients, -> { where(role: 0) }
  scope :aides, -> { where(role: 1) }

  def client?
    role == 0
  end

  def aide?
    role == 1
  end
end
