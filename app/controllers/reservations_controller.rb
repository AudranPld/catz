class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @cat = Cat.find(params[:cat_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)

    @reservation.starting_date = Date.parse(params[:reservation][:starting_date].split(" to ")[0])
    @reservation.ending_date = Date.parse(params[:reservation][:starting_date].split(" to ")[1])
    @reservation.user_id = current_user.id #User.last.id
    @reservation.cat_id = params[:cat_id]
    if @reservation.save
      redirect_to cat_reservations_path(@reservation.cat_id), notice: "The reservation is successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:ending_date, :starting_date)
  end
end
