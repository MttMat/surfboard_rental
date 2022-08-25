class PagesController < ApplicationController
  # We can skip authenticate also for the listing page
  skip_before_action :authenticate_user!, only: :home

  def home
    @surfboards = Surfboard.limit(3)
  end

  def dashboard
    @surfboards = Surfboard.new
  end

  private

  def set_surfboard
    @surfboard = Surfboard.find(params[:id])
  end
end
