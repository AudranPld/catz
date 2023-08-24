class CatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

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
    params.require(:cat).permit(:name, :adress, :gender, :breed, :price, :photo)
  end
end
