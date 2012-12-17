class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :authorize

 
  private
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  
  def authorize
  	unless current_user
        redirect_to :log_in, :notice => "Please log in!"
    end
  end
end
