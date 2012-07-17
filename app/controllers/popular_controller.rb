class PopularController < ApplicationController
  def index
    @urls = Url.find_popular(params[:page])
  end
end
