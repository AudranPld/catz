class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @cat = Cat.find(params[:cat_id])
  end

  def create

    @reservation = Reservation.new(reservation_params)
    @reservation.starting_date = Date.parse(params[:reservation][:starting_date])

    @reservation.ending_date = @reservation.starting_date
    @reservation.user_id = 1
    @reservation.cat_id = params[:cat_id]
    if @reservation.save
      redirect_to cat_reservations_path(@reservation), notice: "The reservation is successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:ending_date, :starting_date)
  end
end
