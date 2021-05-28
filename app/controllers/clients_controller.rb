class ClientsController < ApplicationController
  before_action :authorize_client, only: [:profile]

  def profile
  end

  private

  def authorize_client
    redirect_to(root_path, alert: 'Not allowed to view this page') unless client_signed_in?
  end
end
