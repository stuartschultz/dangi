class UserUrlsController < ApplicationController
  
  before_filter :current_user_authenticate 

  def current_user_authenticate
    flash[:error] = "You do not have access to view this page."
    redirect_to(user_session_path) unless user_signed_in? && current_user.id == params[:id].to_i
  end

  def index
    @urls = Url.find_user_urls(params[:id])
  end

end
