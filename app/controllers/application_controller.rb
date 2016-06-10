class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :is_logged_in

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_logged_in
    !!current_user
    # debugger
  end

  def require_user
    # debugger
    if !is_logged_in
      flash[:danger] = "You have to be signed in first"
      redirect_to root_path
    end
  end
end
