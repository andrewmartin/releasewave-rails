class Api::UserController < ApplicationController
  respond_to :html, :json
  before_action :set_current_api_user

  def update
    @currentUser.update(user_params)
    if @currentUser.save!
      render json: @currentUser
    else
      render json: @currentUser.errors, status: 402
    end
  end

  private
  def user_params
    params.require(:user).permit([
      :password,
      :password_confirmation
    ])
  end

end
