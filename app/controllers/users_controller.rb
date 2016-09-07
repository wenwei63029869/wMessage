class UsersController < ApplicationController
  def create
    User.create(user_params)
  end

  private
  params.require(:user).permit(:username)
end
