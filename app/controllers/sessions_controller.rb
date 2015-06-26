class SessionsController < ApplicationController
  def new
  end

  def create
    begin
      if params[:provider]

        @identity = Identity.from_omniauth(request.env['omniauth.auth'])
        session[:user_id] = @identity.user.id
        flash[:success] = "Welcome, #{@identity.user.first_name}!"
        redirect_to dashboard_path if @identity
      else
        @user = User.find_by_email(params[:email])
        session[:user_id] = @user.id if @user && @user.authenticate(params[:password])
        redirect_to '/login' if !@user.authenticate(params[:password])
        redirect_to dashboard_path if @user.authenticate(params[:password])
      end
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
    end
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'See you!'
    end
    redirect_to root_path
  end
end



