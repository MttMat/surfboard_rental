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
    @rentals = Rental.where(user: current_user)
  end

  def renter
    @rentals = Rental.where(user: current_user)
  end
end
