class BookingsController < ApplicationController
  def create
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new(booking_params)
    @booking.pet = @pet
    @booking.customer = current_user
    if @booking.save
      redirect_to pet_path @pet
    else
      render 'pet/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
