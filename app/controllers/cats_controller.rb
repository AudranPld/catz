class CatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
    @reservation = Reservation.new
    @marker = [{ lat: @cat.latitude, lng: @cat.longitude }]
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
