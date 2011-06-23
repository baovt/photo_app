class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def return_or_redirect_to(url)
    redirect_to(session[:return_to] || url)
    session[:return_to] = nil
  end
end
