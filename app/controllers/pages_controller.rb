class PagesController < ApplicationController

  def index
  end

  def about
  end


  def jointeam
    current_user.teams << Team.find(params[:user][:teams])
    redirect_to dashboard_path
  end

  def dashboard
    @teams = Team.all
    if current_user.teams != []
      @program = current_user.teams.first.program
      @wod = @program.days.where(day: Challenge.first.current_day).first.workouts
      @dailychallenge = @program.days.where(day: Challenge.first.current_day).first.dailychallenges
      @score = Score.new
      @score.day = @program.days.where(day: Challenge.first.current_day)
      @userscore = current_user.scores.first
      @total = ''
    else
    end
  end

  def blog
    @posts = Post.all
  end

  def admin
    @post = current_user.posts.new
  end


end
