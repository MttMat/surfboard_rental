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
end
