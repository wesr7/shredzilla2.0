class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    @users = @team.users
    @totalscore = []
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  private
    def team_params
      params.require(:team).permit(:name, :program_id, :challenge_id)
    end
end
