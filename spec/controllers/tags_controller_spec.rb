require 'rails_helper'

RSpec.describe TagsController, type: :controller do

  let(:user) { build(:user) }
  before { login_user user }

  describe 'GET index' do
    before { xhr :get, :index }
    it { expect(:tags).not_to be_empty }
    it { expect(response).to render_template(:index) }
  end

end
