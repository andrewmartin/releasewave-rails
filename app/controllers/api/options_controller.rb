class Api::OptionsController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  respond_to :json
  before_action :authenticate_api_user!, except: [:show]
  before_action :prepare_option, except: [:show]
  before_action :set_option, only: [:show]

  def show
  end

  def update
    @option.update(option_params)
    @option.save!
  end

  private

  def set_option
    @option = Option.find_by(name: "global")
  end

  def prepare_option
    @option = Option.find_or_create_by!(name: "global")
    @option.save!
  end

  def option_params
    params.require(:option).permit(:featured_date_window_before, :featured_date_window_after)
  end
end
