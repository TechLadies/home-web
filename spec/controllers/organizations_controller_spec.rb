require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

  let(:user) { build(:user) }
  before { login_user user }

  let(:organization) { create(:organization) }

  describe 'GET index' do

    context "when valid" do    
      before { get :index }
      it { expect(:organizations).not_to be_empty }
      it { expect(response).to render_template(:index) }
    end

    context "when valid" do
      before { xhr :get, :index }
      it { expect(:organizations).not_to be_empty }
      it { expect(response).to render_template(:index) }
    end
    
  end

  describe "GET show" do
    before { get :show, id: organization }
    it { expect(response).to render_template(:show) }
  end
 
  describe "GET new" do
    before { get :new }
    it { expect(assigns(:organization)).to be_a_new(Organization) }
    it { expect(response).to render_template(:new) }
  end

  describe "POST create" do

    context "when valid" do
      before { post :create, organization: attributes_for(:organization) }
      it { expect(assigns(:organization)).to be_valid }
      it { expect(response).to redirect_to(organization_path(assigns(:organization))) }
    end
 
    context "when invalid" do
      before { post :create, organization: attributes_for(:organization, :invalid) }
      it { expect(assigns(:organization)).not_to be_valid }
      it { expect(response).to render_template(:new) }
    end

  end

  describe "GET edit" do
    before { get :edit, id: organization.id }
    it { expect(response).to render_template(:edit) }
  end

  describe 'PUT update' do

    context 'when valid' do
      before { put :update, id: organization, organization: attributes_for(:organization) }
      it { expect(assigns(:organization)).to be_valid }
      it { expect(response).to redirect_to(organization_path(assigns(:organization))) }
    end

    context 'when invalid' do
      before { put :update, id: organization, organization: attributes_for(:organization, :invalid) }
      it { expect(assigns(:organization)).not_to be_valid }
      it { expect(response).to render_template(:edit) }
    end

  end

end
