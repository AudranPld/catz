class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create

    @reservation = Reservation.new(reservation_params)
    @reservation.starting_date = Date.parse(params[:reservation][:starting_date])

    @reservation.ending_date = @reservation.starting_date
    if @reservation.save
      raise
      redirect_to reservation_path(@reservation), notice: "The reservation is successfully created."
    else
      raise
      render :new, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:ending_date, :starting_date)
  end
end
