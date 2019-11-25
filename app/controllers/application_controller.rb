# frozen_string_literal: true

class ApplicationController < ActionController::Base
  #google it
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    #finding a user using session cookie and storing it to a variable
    #in order to prevent requests hitting the database everytime
    #||= checks if the left side is false, and if it is- assigns the value of the right side.
    #and if the left side is true, value of @current_user stays as it is (there is no need to check further)
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    #converting to a boolean
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform this action"
      redirect_to root_path
    end
  end
end
