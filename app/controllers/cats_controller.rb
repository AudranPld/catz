class CatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @cats = Cat.all
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR breed ILIKE :query"
      @cats = @cats.where(sql_subquery, query: "%#{params[:query]}%")
    else
      @cats = Cat.all
    end
  end

  def show
    @cat = Cat.find(params[:id])
    @reservation = Reservation.new
    @marker = [{ lat: @cat.latitude, lng: @cat.longitude }]
    @disabled_dates = @cat.reservations.map do |a|
      {
        from: a.starting_date,
        to: a.ending_date
      }
    end

  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    if @cat.save!
      redirect_to cats_path(@cat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :address, :gender, :breed, :price, :photo)
  end
end
