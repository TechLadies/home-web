require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let!(:user) { create(:user) }

  describe "GET new" do
    before { get :new }
    it { expect(response).to render_template(:new) }
  end

  describe "POST create" do
    before { post :create, login_form: params }

    context "with active user" do    
      let(:params) { { email: user.email, password: '123123123' } }
      it { expect(response).to redirect_to(my_account_path) }
    end

  end

# reference to attr_accessor :email, :password (no factory)

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

