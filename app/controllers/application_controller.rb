class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :auth_user

  def auth_user
    current_user ? "dashboard_layout" : "application"
  end
end
