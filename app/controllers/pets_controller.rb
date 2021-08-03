class PetsController < ApplicationController
  before_action :find_pet, only: [:show]
  skip_before_action :authenticate_user!, only: :index

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
    @is_owner = current_user.own_pets.length > 0 ? true : false
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.owner = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  #   if @pet.update(pet_params)
  #     redirect_to @pet
  #   else
  #     render :edit
  #   end
  # end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :category, :description, :pricing)
  end

  def find_pet
    @pet = Pet.find(params[:id])
  end
end
