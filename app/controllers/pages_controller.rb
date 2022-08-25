class PagesController < ApplicationController
  # We can skip authenticate also for the listing page
  skip_before_action :authenticate_user!, only: :home

  def home
    @surfboards = Surfboard.all
  end

  def index
    @surfboards = Surfboard.all
  end

  def dashboard
    @surfboards = Surfboard.new
  end

  def new
    @surfboard = Surfboard.new
  end

  private

  def set_surfboard
    @surfboard = Surfboard.find(params[:id])
  end
end
