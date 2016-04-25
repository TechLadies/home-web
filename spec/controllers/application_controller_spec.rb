require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  let(:user) { build(:user) }
  before { login_user user }

  # describe "GET new" do
  #   before { get :new, case_id: case_file }
  #   it { expect(assigns(:followup)).to be_a_new(FollowUp) }
  #   it { expect(response).to render_template(:new) }
  # end

end


# class ApplicationController < ActionController::Base

#   # Prevent CSRF attacks by raising an exception.
#   # For APIs, you may want to use :null_session instead.
#   protect_from_forgery with: :exception

#   before_filter :set_paper_trail_whodunnit
#   before_action :require_login
#   after_action :logout_deactivated_users

#   protected

#   def require_admin_authorization
#     unless current_user.is_admin?
#       flash[:alert] = "Access Denied. Kindly request access from Admin"
#       redirect_to cases_path
#     end
#   end

#   def logout_deactivated_users
#     if current_user && current_user.inactive?
#       flash[:alert] = "Your account has been deactivated."
#       logout and redirect_to new_session_path
#     end
#   end

# end
