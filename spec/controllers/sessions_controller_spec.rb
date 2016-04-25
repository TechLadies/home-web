require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let(:user) { build(:user) }
  before { login_user user }

# reference to attr_accessor :email, :password (no factory)

# need help
  # describe "GET new" do
  #   before { get :new }
  # end

# need help
  # describe "POST create" do
  #   before { post :create }
  # end
# to validate: user_account_is_active

# need help
  # describe "DELETE destroy" do
  #   before { delete :destroy }
  # end

end

