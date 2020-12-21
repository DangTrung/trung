class Admin::DashboardController < Admin::BaseController
  before_action :logged_in?
  def index
    if logged_in?
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to :controller => '/hompage', :action => 'index'
    end
  end
  def showuser
  end
  def edituser
    @user = User.find_by(id: @current_user.id)
  end
  def updateuser
    @user = User.find_by(id: @current_user.id)
    if @user.update_attributes(dashboard_params)
      flash[:success] = "Profile Updatede"
      redirect_to action: 'showuser'
    else
      render 'edituser'
    end

  end
  private
  def dashboard_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
