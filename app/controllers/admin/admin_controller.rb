class Admin::AdminController < ApplicationController
  before_filter :require_user
  layout "admin"
  
  helper_method :current_user
  
  def current_user_session
    current_user_session ||= UserSession.find
  end
  
  def current_user    
    current_user ||= current_user_session && current_user_session.record
  end
  
  def require_user    
    unless current_user
      session[:return_to] = request.fullpath
      redirect_to admin_login_url
    end
  end
end  
