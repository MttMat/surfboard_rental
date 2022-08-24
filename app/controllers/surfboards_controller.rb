class SurfboardsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @surfboards = Surfboard.all
  end

  def show
    @surfboard = Surfboard.find(params[:id])
  end
end
