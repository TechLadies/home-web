require 'rails_helper'

RSpec.describe CasesController, type: :controller do

  let(:user) { build(:user) }
  before { login_user user }

  let(:case_file) { create(:case_file) }

  describe 'GET index' do
    before { get :index }
	  it { expect(:case_files).not_to be_empty }
	end

  describe 'GET archive' do
    before { get :archive }
	  it { expect(:case_files).not_to be_empty }
	end

  describe "GET show" do
    before { get :show, id: case_file }
    it { expect(response).to render_template(:show) }
  end

  describe "GET new" do
    before { get :new }
    it { expect(assigns(:case_file)).to be_a_new(CaseFile) }
    it { expect(response).to render_template(:new) }
  end

  describe "POST create" do

    context "when valid" do
      before { post :create, case_file: attributes_for(:case_file) }
      it { expect(assigns(:case_file)).to be_valid }
      it { expect(response).to redirect_to(case_path(assigns(:case_file))) }
     end
 
    context "when invalid" do
      before { post :create, case_file: attributes_for(:case_file, :invalid) }
      it { expect(assigns(:case_file)).not_to be_valid }
      it { expect(response).to render_template(:new) }
    end

  end

  describe "GET edit" do
    before { get :edit, id: case_file }
    it { expect(response).to render_template(:edit) }
  end

  describe 'PUT update' do

    context 'when valid' do
      before { put :update, id: case_file, case_file: attributes_for(:case_file) }
      it { expect(assigns(:case_file)).to be_valid }
      it { expect(response).to redirect_to(case_path(assigns(:case_file))) }
    end

    context 'when invalid' do
      before { put :update, id: case_file, case_file: attributes_for(:case_file, :invalid) }
      it { expect(assigns(:case_file)).not_to be_valid }
      it { expect(response).to render_template(:edit) }
    end

  end

  describe 'PUT close' do

# to test if initial is pending, has client, has employer
    it 'successfully change from :pending to :closed' do
    	expect(case_file).to transition_from(:pending).to(:closed).on_event(:close!)
			expect(case_file).to be_closed
			# expect(response).to redirect_to(case_path(case_file))
    end

# to test if unsuccessful .close
   #  it 'unsuccessfully change from :pending to :closed' do
   #  	expect(case_file).not_to transition_from(:pending).to(:closed).on_event(:close!)
			# expect(case_file).to be_pending
			# expect(response).to redirect_to(case_path(case_file))
   #  end

  end

end
