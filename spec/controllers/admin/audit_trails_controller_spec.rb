require 'rails_helper'

RSpec.describe Admin::AuditTrailsController, type: :controller do

  let(:admin) { create(:user, :admin) }
  before { login_user admin }

  describe 'GET index' do
    before { get :index }
	  it { expect(:versions).not_to be_empty }
	end

end
