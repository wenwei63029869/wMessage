class UsersController < ApplicationController
  def create
    @user = User.create(signup_params)
    session[:user_id] = @user.id
    if @user
      cookies.signed[:user_id] = session[:user_id]
      render :json => @user
    else
      render :json => { :errors => @user.errors.full_messages }, status => 422
    end
  end

  private
  def signup_params
    params.require(:user).permit(:username)
  end
end
