class PagesController < ApplicationController

  def index
    # skip_policy_scope
    @posts = Post.all
  end

  def about
  end


  def jointeam
    current_user.teams << Team.find(params[:user][:teams])
    redirect_to dashboard_path
  end

  def dashboard
    # skip_authorization
    @teams = Team.all
    # displays the name of current day
    @today = Date.today.strftime("%A")
    if current_user.teams != []
      @program = current_user.teams.first.program
      @day = @program.days.where(day: Challenge.first.current_day).first
      # @wod - short for workout out of the day
      @wod = @day.workouts
      @dailychallenge = @day.dailychallenges
      @score = Score.new
      @score.day = @day.id
        if current_user.scores != []
          @dailyscore = current_user.scores.last
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
