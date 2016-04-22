require 'rails_helper'

RSpec.describe My::AccountsController, type: :controller do

  let(:user) { build(:user) }

  before { login_user user }

  describe 'GET show' do
    let!(:case_file) { build(:case_file, user: user) }
    before { get :show }
    it { expect(response).to render_template(:show) }
    it { expect(assigns(:account)).not_to be_nil }
  end

  describe 'GET edit' do
    before { get :edit }
    it { expect(response).to render_template(:edit) }
    it { expect(assigns(:account)).not_to be_nil }
  end

  describe 'PUT update' do

    context 'with valid params' do
      before { put :update, user: attributes_for(:user) }
      it { expect(response).to redirect_to(my_account_path) }
      it { expect(assigns(:account)).to be_valid }
    end

    context 'with invalid params' do
      before { put :update, user: attributes_for(:user, :invalid) }
      it { is_expected.to render_template(:edit) }
      it { expect(assigns(:account)).not_to be_valid }
    end

  end

end
