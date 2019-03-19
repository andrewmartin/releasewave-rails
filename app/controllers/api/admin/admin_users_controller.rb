class Api::Admin::AdminUsersController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  respond_to :html, :json

  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_api_user!, except: [:index, :show]

  def index
    @users = User.all
    render template: 'api/users/index'
  end

  def show
    @user = User.find(params[:id])
    render template: 'api/users/show'
  end

  def new
    @user = User.new
    render template: 'api/users/create'
  end

  def update
    @user.update(user_params)
    render template: 'api/users/update'
  end

  def destroy
    @user.destroy!
    render json: @user
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name)
    end
end
