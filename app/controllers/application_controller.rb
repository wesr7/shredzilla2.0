class ApplicationController < ActionController::Base
  # include Pundit

  # Globally rescue Authorization Errors in controller.
  # Returning 403 Forbidden if permission is denied
  # rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    # helper_method :current_user # ensures that it can be called from the views, as well.

    def authorize
      redirect_to '/login' unless current_user
    end

    def permission_denied
      head 403
    end

end
