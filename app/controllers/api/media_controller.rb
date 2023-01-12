class Api::MediaController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  respond_to :html, :json
  before_action :set_media, except: [:create, :index]

  def create
    @media = Media.new(media_params.except(*[:image]))
    @media.image.attach(data: media_params[:image])
    # @media.caption = media_params[:caption] # TODO Cleanup
    @media.save!
  end

  def update
    @media.update(media_params)
  end

  def show
  end

  def index
    @media = Media.byPage(params[:per_page], params[:page])
  end

  def destroy
    @media.destroy!
    render json: @media
  end

  private

  def set_media
    @media = Media.find(params[:id])
  end

  def media_params
    params.require(:media).permit([:image, :caption])
  end
end
