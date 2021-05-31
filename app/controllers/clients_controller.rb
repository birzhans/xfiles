class ClientsController < ApplicationController
  before_action :authorize_client

  def profile
  end

  def starred
    @starred = current_client.aides
  end

  def star_aide
    starred_aide = StarredAide.find_by(client_id: current_client.id, aide_id: params[:aide_id])
    if starred_aide
      starred_aide.destroy
    else
      StarredAide.create(client_id: current_client.id, aide_id: params[:aide_id])
    end
  end

  private

  def authorize_client
    redirect_to(root_path, alert: 'Not allowed to view this page') unless client_signed_in?
    @current_user = current_client
  end
end
