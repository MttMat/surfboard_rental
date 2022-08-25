class RentalsController < ApplicationController
  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @rental.booking_status = "pending"
    @rental.surfboard = Surfboard.find(params[:surfboard_id])
    if @rental.save
      redirect_to dashboard_path, notice: 'Booking made.'
    else
      render 'surfboards/show'
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:starting_date, :return_date)
  end
end
