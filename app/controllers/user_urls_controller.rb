class UserUrlsController < ApplicationController
  def index
    @urls = Url.find_user_urls(params[:id])
  end
end
