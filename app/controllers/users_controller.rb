class UsersController < ApplicationController
  def create
    @user = User.create(username: params['username'])
    session[:user_id] = @user.id
    if @user
      render :json => @user
    else
      render :json => { :errors => @user.errors.full_messages }, status => 422
    end
  end
end
