class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
end


# def show
#   @posts = User.find_by(user_name: params[:user_name])
# end  
