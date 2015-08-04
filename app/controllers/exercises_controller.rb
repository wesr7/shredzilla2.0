class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
  end
  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
        redirect_to exercises_path(@exercise)
    else
        render "new"
    end
  end
  def edit
    @exercise = Exercise.find(params[:id])
    @exercise.save
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  private
  def exercise_params
    params.require(:exercise).permit(:name, :video)
  end
end




