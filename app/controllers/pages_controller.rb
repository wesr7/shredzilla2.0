class PagesController < ApplicationController

  def index
  end

  def about
  end

  def dashboard
    @teams = Team.all
    @program = current_user.teams.first.program
    @wod = @program.days.where(day: Challenge.first.current_day).first.workouts


  end

  def jointeam
    current_user.teams << Team.find(params[:user][:teams])
    redirect_to dashboard_path
  end

end
