class Api::UserController < ApplicationController
  respond_to :html, :json
  before_action :set_current_api_user

  private
  def user_params
    params.require(:user).permit([
      :password,
      :password_confirmation
    ])
  end
end