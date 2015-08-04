class DailychallengesController < ApplicationController
  def index
    @dailychallenges = Dailychallenge.all
  end

  def new
    @dailychallenge = Dailychallenge.new
  end

  def create
    @dailychallenge = Dailychallenge.new(dailychallenge_params)
    if @dailychallenge.save!
        redirect_to dailychallenges_path(@dailychallenge)
    else
        render new
    end
  end

  def show
    @dailychallenge = Dailychallenge.find(paras[:id])
  end

  private
  def dailychallenge_params
    params.require(:dailychallenge).permit(:day_id, :description)
  end
end
