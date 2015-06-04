class ApplicationController < ActionController::Base
  # Include all Pundit class methods.
  include Pundit

  # Globally rescue Authorization Errors in controller.
  # Returning 403 Forbidden if permission is denied
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # after_action :verify_authorized, :except => :index
  # after_action :verify_policy_scoped, :only => :index

  # allows you to use current_user in the view
  helper_method :current_user

  private
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    # def authorize
    #   redirect_to '/login' unless current_user
    # end

    def permission_denied
      head 404
    end

end
