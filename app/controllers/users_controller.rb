class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @my_reviews = @user.my_reviews
    authorize @user
  end
end
