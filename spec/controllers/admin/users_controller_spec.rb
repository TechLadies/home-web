require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

  let(:admin) { create(:user, :admin) }
  before { login_user admin }

  let(:user) { create(:user) }

  describe 'GET index' do
    before { get :index }
	  it { expect(:users).not_to be_empty }
	  it { expect(response).to render_template(:index) }
	end

  describe "GET show" do
    before { get :show, id: user }
    it { expect(response).to render_template(:show) }
  end

  describe "GET new" do
    before { get :new }
    it { expect(assigns(:user)).to be_a_new(User) }
    it { expect(response).to render_template(:new) }
  end

  describe "POST create" do

    context "when valid" do
      before { post :create, user: attributes_for(:user) }
      it { expect(assigns(:user)).to be_valid }
      it { expect(response).to redirect_to(admin_user_path(assigns(:user))) }
    end
 
    context "when invalid" do
      before { post :create, user: attributes_for(:user, :invalid) }
      it { expect(assigns(:user)).not_to be_valid }
      it { expect(response).to render_template(:new) }
    end

  end

  describe "GET edit" do
    before { get :edit, id: user }
    it { expect(response).to render_template(:edit) }
  end

  describe 'PUT update' do

    context 'when valid' do
      before { put :update, id: user, user: attributes_for(:user) }
      it { expect(assigns(:user)).to be_valid }
      it { expect(response).to redirect_to(admin_user_path(assigns(:user))) }
    end

    context 'when invalid' do
      before { put :update, id: user, user: attributes_for(:user, :invalid) }
      it { expect(assigns(:user)).not_to be_valid }
      it { expect(response).to render_template(:edit) }
    end

  end

  describe 'states' do

	  describe ':inactive' do

  		it 'should be :inactive initial' do
  			expect(user).to be_inactive
  		end

      it 'should change from :inactive to :active ' do
				expect(user).to transition_from(:inactive).to(:active).on_event(:activate)
				expect(user).to be_active
      end

      it 'should change from :active to :inactive ' do
				expect(user).to transition_from(:active).to(:inactive).on_event(:deactivate)
				expect(user).to be_inactive
      end

    end

  end

end
