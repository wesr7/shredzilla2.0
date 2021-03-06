class ScoresController < ApplicationController
  def index
    @scores = Score.all
  end

  def new
    @score = Score.new
  end

  def create
    # render plain: params
    @score = Score.new(score_params)
    if @score.save
        redirect_to dashboard_path
    else
        render 'new'
    end
  end

  def edit
    @score = Score.find(params[:id])
  end

  def update
    @score = Score.find(params[:id])
    if @score.update_attributes
        redirect_to score_path(@score)
    else
        render 'new'
    end
  end

  def show
    @score = Score.find(params[:id])
  end

  private
  def score_params
    params.require(:score).permit(:day, :user_id, :food, :workout, :sleep, :daily_update, :challenge, :total, :note)
  end

end
