class PagesController < ApplicationController

  def index
    skip_policy_scope
  end

  def about
  end


  def jointeam
    current_user.teams << Team.find(params[:user][:teams])
    redirect_to dashboard_path
  end

  def dashboard
    skip_authorization
    @teams = Team.all
    if current_user.teams != []
      @program = current_user.teams.first.program
      @wod = @program.days.where(day: Challenge.first.current_day).first.workouts
      @dailychallenge = @program.days.where(day: Challenge.first.current_day).first.dailychallenges
      @score = Score.new
      @score.day = @program.days.where(day: Challenge.first.current_day)
      if current_user.scores != []
      @dailyscore = current_user.scores.first
      @dailyscore.total = @dailyscore.food + @dailyscore.workout + @dailyscore.sleep + @dailyscore.challenge + @dailyscore.daily_update
      @dailyscore.save!
      @userscores = current_user.scores
      @totalscore = []
    else
    end
  end
  end

  def blog
    @posts = Post.all
  end

  def admin
    @post = current_user.posts.new
  end


end
