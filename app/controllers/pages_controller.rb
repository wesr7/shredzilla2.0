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
    @team = Membership.where(user_id: current_user.id)
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
          @dailyscore = current_user.scores.where(day: Challenge.first.current_day).first
          @userscore = current_user.scores.last
          @userscore.total = @userscore.food + @userscore.workout + @userscore.sleep + @userscore.challenge + @userscore.daily_update
          @userscore.save!
          @userscores = current_user.scores
          @totalscore = []
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
