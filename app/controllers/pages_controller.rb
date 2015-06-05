class PagesController < ApplicationController

  def index
    @posts = Post.all
  end

  def about
  end


  def jointeam
    current_user.teams << Team.find(params[:user][:teams])
    redirect_to dashboard_path
  end

  def dashboard
    @teams = Team.all
    @today = Date.today.strftime("%A")
    if current_user.teams != []
      @program = current_user.teams.first.program
      @day = @program.days.where(day: Challenge.first.current_day).first
      @wod = @day.workouts
      @dailychallenge = @day.dailychallenges
      @score = Score.new
      @score.day = @day.id
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
