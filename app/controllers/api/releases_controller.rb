class Api::ReleasesController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :authenticate_api_user!, except: [:index, :show]

  respond_to :html, :json
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
    if(params[:start_date] and params[:end_date])
        @releases = Release.where(:release_date => params[:start_date]..params[:end_date]).paginate :page => params[:page]
    else
        @releases = Release.paginate :page => params[:page]
    end
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

