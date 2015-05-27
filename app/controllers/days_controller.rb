class DaysController < ApplicationController

  def index
    @days = Day.all
  end

  def show
    @day = Day.find(params[:id])
  end

end
