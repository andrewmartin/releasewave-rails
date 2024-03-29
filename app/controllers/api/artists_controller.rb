class Api::ArtistsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :authenticate_api_user!, except: [:index, :show, :releases]

  respond_to :html, :json
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def show
  end

  def create
    params = artist_params.except(*[:image])
    @artist = Artist.new(params)
    @artist.updateWithImage(artist_params)
  end

  def edit
    respond_with @artist
  end

  def update
    @artist.updateWithImage(artist_params)
  end

  def index
    @artists = Artist
      .search(params[:search])
      .orderByUpdated.paginate :page => params[:page]
  end

  def releases
    @artist = Artist.friendly.find(params[:artistSlug])
    @releases = Release.joins(:artists).where(artists: { id: @artist.id }).paginate :page => params[:page]
  end

  def destroy
    @artist.destroy!
    render json: @artist
  end

  private

  def set_artist
    @artist = Artist.friendly.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:short_description, :search, :website, :name, :bandcamp, :facebook, :soundcloud, :spotify, :youtube, :itunes, :twitter, :instagram, image: [:content_type, :filename, :data])
  end
end
