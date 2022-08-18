class Api::TokenRefreshesController < ApplicationController
    include DeviseTokenAuth::Concerns::SetUserByToken

    before_action :authenticate_api_user!, except: [:index, :show]
    before_action :set_current_api_user, only: [:current_user]

  end
