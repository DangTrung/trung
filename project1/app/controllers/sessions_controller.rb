class SessionsController < ApplicationController
  def new
    @allcate = Category.all
    @cate = Category.includes(:children).where(parent_id: params[nil]) 
    if logged_in?
      redirect_to :controller => 'admin/dashboard', :action => 'index'
    end
    
  end
  def create
    @allcate = Category.all
    @cate = Category.includes(:children).where(parent_id: params[nil]) 
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      flash.now[:noitice] = "Login successfully"
      session[:user_id] = @user.id
      redirect_to :controller => 'admin/dashboard', :action => 'index'
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  def destroy
    log_out
    redirect_to root_path
  end
private
 def log_out
  session.delete(:user_id)
  @current_user = nil
 end
 def current_user
  @current_user ||= User.find_by(id: session[:user_id])
 end
 def logged_in?
  !current_user.nil?
 end
end
