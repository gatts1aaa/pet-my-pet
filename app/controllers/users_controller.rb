class UsersController < ApplicationController

  def profile
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def article_params
    params.require(:user).permit(:name, :description, :photo)
  end

  def find_pet
    @user = User.find(params[:id])
  end
end
