class Api::ReviewsController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :authenticate_api_user!, except: [:index, :show]

  respond_to :html, :json
  before_action :set_release
  before_action :set_review, only: [:update, :show, :destroy]
  before_action :require_permission, only: [:edit, :update, :destroy]

  def create
    @review = @release.reviews.new(review_params)
    @review.user = current_api_user
    @review.save!
  end

  def edit
    respond_with @review
  end

  def update
    @review.update(review_params)
  end

  def index
    @reviews = @release.reviews.paginate :page => params[:page]
  end

  def destroy
    @review.destroy!
    render json: @review
  end

  private
    def set_release
      @release = Release.friendly.find(params[:release_id])
    end

    def set_review
      @review = @release.reviews.friendly.find(params[:id])
    end

    def require_permission
      if current_api_user != @review.user
        render body: nil, status: :unauthorized
      end
    end

    def review_params
      params.require(:review).permit(:name, :content, :score)
    end
end

