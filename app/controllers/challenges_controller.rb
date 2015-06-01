class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end

  def new
    @challenge = Challenge.new
    @programs = Program.all
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.programs << Program.all # Associate all existing Programs with created challenge.

    if @challenge.save
      redirect_to root_path
    else
      render new
    end
    # render plain: params
  end

  def show
  end

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def update
    @challenge = Challenge.find(params[:id])

    if @challenge.update_attributes(challenge_params)
      redirect_to root_path
    else
      render edit, :alert => "Unable to update challenge."
    end
  end

  private
    def challenge_params
      params.require(:challenge).permit(:name, :start_date, :current_day)
    end
end
