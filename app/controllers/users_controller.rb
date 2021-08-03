class UsersController < ApplicationController
  def profile
  end

  private

  def article_params
  params.require(:user).permit(:name, :description, :photo)
  end
end
