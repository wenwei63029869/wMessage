class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: login_params[:username])
    if @user
      session[:user_id] = @user.id
      render json: @user
    else
      render json: "Can't find this user", status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    render :json => { :success => "success", :status_code => "200" }
  end

  private
  def login_params
    params.require(:user).permit(:username)
  end
end