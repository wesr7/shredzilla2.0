class PagesController < ApplicationController

  def index
  end

  def about
  end

  def dashboard
    @teams = Team.all
    @workout = team.program.day
  end

  def jointeam
    current_user.teams << Team.find(params[:user][:teams])
    redirect_to dashboard_path
  end

end
