class UsersController < ApplicationController

  def profile # = show
    @owner = !current_user.own_pets.empty?
  end

  private

  def article_params
    params.require(:user).permit(:name, :decription, :photo)
  end

end
