class UsersController < ApplicationController

  def profile # = show
    @owner = !current_user.own_pets.empty?
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def article_params
    params.require(:user).permit(:name, :description, :photo)
    params.require(:user).permit(:name, :decription, :photo)
  end

  def find_pet
    @user = User.find(params[:id])
  end
end
