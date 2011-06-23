class Admin::UserSessionsController < Admin::AdminController
  skip_before_filter :require_user, :except => :destroy
  layout "login"
  
  def new
    redirect_to root_url if current_user
    
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:success] = "You've signed in!" 
      return_or_redirect_to admin_root_url
   else
      render :new
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    
    redirect_to admin_root_url
  end

end
