class Api::ReleasesController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :authenticate_api_user!, except: [:index, :show]

  respond_to :json
  before_action :set_release, only: [:show, :edit, :update, :destroy]

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
    @releases = Release.ranged(
      params[:start_date],
      params[:end_date]
    )
      .featured(params[:featured])
      .orderByReleaseDate
      .byPage(params[:per_page], params[:page])
    #   .byName(params[:name])
  end

  def search
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
    params.require(:release).permit(:name, :featured, :search, :buy, :release_date, :description, :short_description, image: [:content_type, :filename, :data], :artist_ids => [], :embed_code => [])
  end
end
