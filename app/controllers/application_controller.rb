class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  protected

  def require_admin_authorization
    unless current_user.roles.include? "Admin"
      flash[:alert] = "Access Denied. Kindly request access from Admin"
      redirect_to cases_path
    end
  end

end
