class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      render new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # render plain: params[:user][:team_ids]
    @user = User.find(params[:id])
    @teams = @user.teams << params[:user][:team_ids].values.each do
    if @teams.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :height, :weight, :fitness)
    end
end
