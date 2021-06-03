class RequestsController < ApplicationController
  before_action :authorize_client!, only: [:new, :create]
  before_action :set_request, only: [:accept]
  def index
    requestable = current_user.client? ? current_user.client : current_user.aide
    @requests = Request.participating(requestable).order('updated_at DESC')
    @pending = @requests.where(status: 0)
    @in_process = @requests.where(status: 1)
    @done = @requests.where(status: 2)
    @declined = @requests.where(status: 3)
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

  def accept
    @request.update(status: 1)
    redirect_to requests_path
  end

  private

  def request_params
    params.require(:request).permit(:details, :aide_id)
  end

  def set_request
    @request = Request.find(params[:request_id])
  end

  def authorize_client!
    redirect_to aides_path, alert: 'Restricted access' unless current_user.client?
  end
end
