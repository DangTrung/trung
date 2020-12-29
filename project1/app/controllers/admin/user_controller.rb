class Admin::UserController < Admin::BaseController
  before_action :logged_in?
  load_and_authorize_resource :except => [:index]
  before_action :load_permissions
    def index
        @user = User.where.not(id: session[:user_id])
        @role = Role.all.includes(:users)
    end
    def new
        @user = User.new
        @role = Role.all
      
    end
    def create 
        @user = User.new(user_params)
        @role = Role.all
        if @user.save
          flash[:success] = 'Sucessfull creating new user'
          redirect_to :controller => 'dashboard', :action => 'index'
        else
          render 'new'
        end
       
    end
    def destroy
       # debugger
        @destroy = User.find_by(id: params[:id])
        @destroy.destroy
        flash[:success]= "User Deleted"
        @user = User.all
        redirect_to :action => 'showalluser'
    end
    def edit
        @role = Role.all
        @user = User.find_by(id: params[:id])
    end
    def update
        @user = User.find_by(id: params[:id])
          if @user.update_attributes(user_params) 
              flash[:success] = "Profile updated"
              redirect_to :controller => 'dashboard', :action => 'index'
          else
            @role = Role.all
              render 'edit'
          end
      end
    private 
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :role_id, :avatar)
      end
end
