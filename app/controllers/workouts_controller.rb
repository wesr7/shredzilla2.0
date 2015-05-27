class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
        redirect_to workouts_path
    else
        render 'new'
    end
  end

  def edit
    @workout = Workout.find(parmas[:id])
    if @workout.save
        redirect_to workout_path(@workout)
    else
        render 'new'
    end
  end

  def show
    @workouts = Workout.find(params[:id])
  end

  private
  def workout_params
    params.require(:workout).permit(:day_id, :exercise_id, :hold, :reps, :sets, :timer)
  end

end
