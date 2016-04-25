require 'rails_helper'

RSpec.describe Admin::TagsController, type: :controller do

  let(:admin) { create(:user, :admin) }
  before { login_user admin }

  let(:tag) { create(:tag) }

  describe 'GET index' do
    before { get :index }
	  it { expect(:tags).not_to be_empty }
	end

  describe "GET new" do
    before { get :new }
    it { expect(assigns(:tag)).to be_a_new(Tag) }
  end

  describe "POST create" do

    context "when valid" do
      before { post :create, tag: attributes_for(:tag) }
      it { expect(assigns(:tag)).to be_valid }
      it { expect(response).to redirect_to(admin_tags_path) }
    end

#rework after merge 
    # context "when invalid" do
    #   before { post :create, tag: attributes_for(:tag, :invalid) }
    #   it { expect(assigns(:tag)).not_to be_valid }
    #   it { expect(response).to render_template(:new) }
    # end

  end

#rework 
  describe "GET edit" do
    before { get :edit, id: tag }
    it { expect(response).to render_template(:edit) }
  end

  describe 'PUT update' do

    context 'when valid' do
      before { put :update, id: tag, tag: attributes_for(:tag) }
      it { expect(assigns(:tag)).to be_valid }
      it { expect(response).to redirect_to(admin_tags_path) }
    end

    context 'when invalid' do
      before { put :update, id: tag, tag: attributes_for(:tag, :invalid) }
      it { expect(assigns(:tag)).not_to be_valid }
      it { expect(response).to render_template(:edit) }
    end

  end

end
