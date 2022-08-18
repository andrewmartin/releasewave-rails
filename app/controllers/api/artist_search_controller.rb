require "url_api"

class Api::ArtistSearchController < ApplicationController
  respond_to :json

  def get
    @url = UrlApi.new()
    @response = @url.get(params[:search])
    render :json => @response
  end
end

