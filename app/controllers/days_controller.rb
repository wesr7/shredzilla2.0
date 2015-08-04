class DaysController < ApplicationController

  def index
    @days = Day.all
  end

  def new
    @day = Day.new
  end

  def create
    @day = Day.new(day_params)
    if @day.save
        redirect_to days_path(@day)
    else
        render "new"
    end
  end

  def show
    @day = Day.find(params[:id])
  end

  private
  def day_params
    params.require(:day).permit(:program_id, :day, :description, :option_1, :option_2)
  end


end
