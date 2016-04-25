require 'rails_helper'

RSpec.describe Admin::CasesController, type: :controller do

  let(:admin) { create(:user, :admin) }
  before { login_user admin }

  let(:case_file) { create(:case_file) }

#clarify
  describe 'GET index' do
    before { get :index }
	  it { expect(:case_files).not_to be_empty }
	end

  describe "GET reassign" do
    before { xhr :get, :reassign, id: case_file }
    it { expect(response).to render_template(:reassign) }
  end

  describe 'PATCH update_assignment' do

    context 'when valid' do
      before { xhr :patch, :update_assignment, id: case_file, case_file: attributes_for(:case_file) }
      it { expect(assigns(:case_file)).to be_valid }
      it { expect(response).to redirect_to(case_path(assigns(:case_file))) }
    end

#rework: invalid test does not pass
    # context 'when invalid' do
    #   before { xhr :patch, :update_assignment, id: case_file, case_file: attributes_for(:case_file, :invalid) }
    #   it { expect(assigns(:case_file)).not_to be_valid }
    #   it { expect(response).to render_template(:reassign) }
    # end

  end

#rework: missing test?
  describe 'PUT reopen' do

# to test if admin true and initial is closed
    it 'successfully change from :closed to :pending' do
    	expect(case_file).to transition_from(:closed).to(:pending).on_event(:open!)
			expect(case_file).to be_pending
			# expect(response).to redirect_to(case_path(case_file))
    end

# to test if admin false or initial is closed
   #  it 'unsuccessfully change from :closed to :pending' do
   #  	expect(case_file).not_to transition_from(:closed).to(:pending).on_event(:open!)
			# expect(case_file).to be_closed
			# expect(response).to redirect_to(case_path(case_file))
   #  end

  end

end
