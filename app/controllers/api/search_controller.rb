class Api::SearchController < ApplicationController
    respond_to :json

    def search
        respond_with Release.all
    end
end
