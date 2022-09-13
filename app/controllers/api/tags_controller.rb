class Api::TagsController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :authenticate_api_user!, except: [:index, :show]

  respond_to :json
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def create
    params = release_params.except(*[:image, :embed_code, :artist_ids])
    @tag = Tag.new(params)
    @tag.updateOrCreate(release_params)
  end

  def edit
    respond_with @tag
  end

  def update
    @tag.updateOrCreate(release_params)
  end

  def index
    @tags = Tag.all
  end

  def search
  end

  def destroy
    @tag.destroy!
    render json: @tag
  end

  private

  def set_tag
    @tag = Tag.friendly.find(params[:id])
  end

  def release_params
    params.require(:tag).permit(:name)
  end
end
