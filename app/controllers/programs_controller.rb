class ProgramsController < ApplicationController
  def index
    @programs = Program.all
  end

  def show
    @program = Program.find(params[:id])
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)

    if @program.save
      redirect_to root_path
    else
      render new
    end
  end

  def edit
    @program = Program.find(params[:id])
  end

  private
    def program_params
      params.require(:program).permit(:name)
    end
end
