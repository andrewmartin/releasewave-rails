class Api::ArtistsController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_api_user! #, except: [:index]

  respond_to :html, :json
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def create
    if artist_params[:image]
      picture_params = artist_params[:image]
      data = picture_params[:data]
      filename = picture_params[:filename]

      params = artist_params.reject! { |k| k == 'image' }
      @artist = Artist.new(params)

      image_file = Paperclip.io_adapters.for(data)
      image_file.original_filename = filename
      @artist.image                = image_file

      @artist.save!
    else
      @artist = Artist.new(artist_params)
      @artist.save!
    end
  end

  def edit
    respond_with @artist
  end

  def update
    @artist.update(artist_params)
    @artist.save!
  end

  def index
    @artists = Artist.paginate :page => params[:page]
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, image: [:content_type, :filename, :data])
    end
end
