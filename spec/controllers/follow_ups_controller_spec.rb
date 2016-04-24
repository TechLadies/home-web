require 'rails_helper'

RSpec.describe FollowUpsController, type: :controller do

  let(:user) { build(:user) }
  before { login_user user }

  let(:case_file) { create(:case_file) }

  describe "GET new" do
    before { xhr :get, :new, case_id: case_file }
    it { expect(assigns(:followup)).to be_a_new(FollowUp) }
    it { expect(response).to render_template(:new) }
  end
 
  describe "POST create" do

    context "when valid" do
      before { xhr :post, :create, case_id: case_file, entry: attributes_for(:follow_up) }
      it { expect(assigns(:followup)).to be_valid }
      it { expect(response).to render_template(:create) }
     end
 
    context "when invalid" do
      before { xhr :post, :create, case_id: case_file, entry: attributes_for(:follow_up, :invalid) }
      it { expect(assigns(:followup)).not_to be_valid }
      it { expect(response).to render_template(:new) }
    end

  end

end
