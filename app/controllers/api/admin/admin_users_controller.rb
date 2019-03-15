class Api::Admin::AdminUsersController < ApplicationController
  respond_to :html, :json

  before_action :set_user, only: [:show, :update, :destroy]
  before_action :set_current_api_user
  before_action :check_if_admin

  def index
    @users = User.all
    puts @users.inspect
    respond_with(@users)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    respond_with(@user)
  end

  def update
    @user.update(user_params)
    respond_with(@user)
  end

  def destroy
    @user.destroy!
    render json: @user
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def city_params
      params.require(:city).permit([:id])
    end

    def user_params
      params.require(:user).permit([:price, :start_date])
    end

end
