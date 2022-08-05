class SessionsController < ApplicationController

  def new

  end

  def create
    if user = login(params[:email], params[:password])
      # update_browser_uuid user.uuid

      flash[:notice] = "login sccess"
      redirect_to root_path
    else
      flash[:notice] = "email or password incorrect, please check."
      redirect_to new_session_path
    end
  end

  def destroy
    logout
    cookies.delete :user_uuid
    flash[:notice] = "logout success"
    redirect_to root_path
  end

end