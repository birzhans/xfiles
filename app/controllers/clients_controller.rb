class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_client

  def favourites
    @aides = current_user.client.aides
  end

  def favourite_aide
    favourite_aide = FavouriteAide.find_by(client_id: current_user.id, aide_id: params[:aide_id])
    if favourite_aide
      favourite_aide.destroy
    else
      FavouriteAide.create(client_id: current_user.client.id, aide_id: params[:aide_id])
    end
  end

  private

  def authorize_client
    redirect_to(root_path, alert: 'Not allowed to view this page') unless current_user.client?
  end
end
