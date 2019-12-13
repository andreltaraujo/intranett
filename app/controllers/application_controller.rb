class ApplicationController < ActionController::Base

  #Prevent CSRF attacks by raising an exception.
  protect_from_forgery

  # Pundit
  include Pundit

  # Manages Pundit Errors
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

protected 

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
