class HomeController < ActionController::Base
  def index
    @releases = Release.order(release_date: :asc).last(25)
    respond_to do |format|
      format.html
      format.rss { render :layout => false }
    end
  end
end