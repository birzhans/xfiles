class Request < ApplicationRecord
  belongs_to :aide
  belongs_to :client

  enum status: { 'Pending': 0, 'In process': 1, 'Done': 2, 'Declined': 3 }

  validates :details, presence: true

  scope :participating, -> (user) do
    where("(requests.client_id = ? OR requests.aide_id = ?)", user.id, user.id)
  end


  def pending?
    status == 'Pending'
  end

  def in_process?
    status == 'In process'
  end

  def conversation
    Conversation.between(aide.user.id, client.user.id)[0]
  end
end
