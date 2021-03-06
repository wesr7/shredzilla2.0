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
      redirect_to dashboard_path
    else
      render new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to dashboard_path
    else
      render new
    end
  end

  def update
    @email = :q
    @user = User.where(email: :q)
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to dashboard_path
    else
      render new
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :height, :weight, :fitness)
    end
end
