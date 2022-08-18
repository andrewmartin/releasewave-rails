class Api::SearchController < ApplicationController
    respond_to :json

    def search
      @releases = Release.search(params[:query]).paginate :page => params[:page]
      @artists = Artist.search(params[:query]).paginate :page => params[:page]
    +
      render :search
    end
end
