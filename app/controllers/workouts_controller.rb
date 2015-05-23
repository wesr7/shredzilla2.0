class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
  

  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workouts_params)
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
    @workout = Workout.find(parmas[:id])
  end

end
