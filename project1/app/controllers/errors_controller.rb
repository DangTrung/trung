class ErrorsController < ApplicationController
  layout :layout
  def show
  end
  def current_user
    User.find_by(id: session[:user_id])
  end
  def layout
    'admin/admin' if params[:path].split("/")[0] == "admin"
  end
end
