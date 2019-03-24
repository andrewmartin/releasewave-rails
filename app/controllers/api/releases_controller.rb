class Api::ReleasesController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :authenticate_api_user!, except: [:index, :show]

  respond_to :html, :json
  before_action :set_release, only: [:show, :edit, :update, :destroy]
  # skip_before_action :verify_authenticity_token

  def create
    params = release_params.except(*[:image, :embed_code, :artist_ids])
    @release = Release.new(params)
    @release.updateOrCreate(release_params)
  end

  def edit
    respond_with @release
  end

  def update
    @release.updateOrCreate(release_params)
  end

  def index
    @releases = Release.paginate :page => params[:page]
  end

  def destroy
    @release.destroy!
    render json: @release
  end

  private
    def set_release
      @release = Release.friendly.find(params[:id])
    end

    def release_params
      params.require(:release).permit(:name, :search, :buy, :release_date, :description, :short_description, image: [:content_type, :filename, :data], :artist_ids => [], :embed_code => [])
    end
end

