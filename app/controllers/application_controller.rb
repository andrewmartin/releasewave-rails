class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session

  respond_to :json

  def set_current_api_user
    @currentUser = current_api_user
  end

  def check_if_admin
    @currentUser = current_api_user
    @errorText = 'You must be logged in to view this resource.'
    @json = {
      success: false,
      errors: [@errorText]
    }

    if @currentUser.nil?
      render json: @json, status: 406
    elsif @currentUser.is_admin.blank?
      render json: @json, status: 406
    end
  end

  rescue_from StandardError do |exception|
    # Handle only JSON requests
    raise unless request.format.json?

    err = {error: exception.message}

    err[:backtrace] = exception.backtrace.select do |line|
      # filter out non-significant lines:
      %w(/gems/ /rubygems/ /lib/ruby/).all? do |litter|
         not line.include?(litter)
      end
    end if Rails.env.development? and exception.is_a? Exception

    # duplicate exception output to console:
    STDERR.puts ['ERROR:', err[:error], ''].concat(err[:backtrace] || []).join "\n"

    render :json => err, :status => 500
  end

end
