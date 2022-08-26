class SurfboardsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    if params[:query].present?
      sql_query = "brand ILIKE :query OR shape ILIKE :query"
      @surfboards = Surfboard.where(sql_query, query: "%#{params[:query]}%")
    else
      @surfboards = Surfboard.all
    end
  end

  def show
    @surfboard = Surfboard.find(params[:id])
    @rental = Rental.new
  end

  def new
    @surfboard = Surfboard.new
  end

  def create
    @surfboard = Surfboard.new(surfboard_params)
    @surfboard.user = current_user
    @surfboard.save
    redirect_to  surfboards_index_path
  end


  private
  def surfboard_params
    params.require(:surfboard).permit(:description, :brand, :material_type, :shape, :lenght, :address, :price)
  end
end
