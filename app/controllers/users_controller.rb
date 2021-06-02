class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to profile_users_path, notice: 'Your data was successfully updated.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :link, :bio, :phone)
  end
end
