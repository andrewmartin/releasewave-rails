class Api::UserController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  respond_to :html, :json
  before_action :set_current_api_user, only: [:current_user]

  def current_user
    @currentUser = current_api_user
    @errorText = 'You must be logged in to view this resource.'
    @json = {
      success: false,
      errors: [@errorText]
    }

    if @currentUser.nil?
      render json: @json, status: 401
    elsif
      render json: @currentUser, status: 200
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
