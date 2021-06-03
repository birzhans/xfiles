class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :change_status, :destroy]
  before_action :authorize_client!, only: [:new, :create]
  before_action :authorize_aide!, only: [:change_status]

  def index
    requestable = current_user.client? ? current_user.client : current_user.aide
    @requests = Request.participating(requestable).order('updated_at DESC')
    @pending = @requests.where(status: 0)
    @in_process = @requests.where(status: 1)
    @done = @requests.where(status: 2)
    @declined = @requests.where(status: 3)
  end

  def show
  end

  def new
    @aide = Aide.find(params[:aide_id])
    @request = Request.new(aide_id: @aide.id)
  end

  def create
    @request = current_user.client.requests.new(request_params)

    if @request.save
      redirect_to requests_path, notice: 'request successfully created'
    else
      redirect_to aides_path, error: 'something went wrong'
    end
  end

  def change_status
    @request.update(status: params[:status].to_i)
    redirect_to requests_path
  end

  def destroy
    @request.destroy
    redirect_to requests_path, notice: 'Request was successfully deleted'
  end

  private

  def request_params
    params.require(:request).permit(:details, :aide_id)
  end

  def set_request
    @request = Request.find(params[:id])
  end

  def authorize_client!
    redirect_to aides_path, alert: 'Restricted access' unless current_user.client?
  end

  def authorize_aide!
    redirect_to aides_path, alert: 'Restricted access' unless current_user.aide?
  end
end
