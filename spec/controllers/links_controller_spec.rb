require 'rails_helper'

RSpec.describe LinksController, type: :controller do

  let(:user) { build(:user) }
  before { login_user user }

  let(:case_file) { create(:case_file) }
  let!(:link) { create(:link, case_file: case_file) }

  describe "POST create" do

    context "when valid" do
      before { xhr :post, :create, case_id: case_file, link: attributes_for(:link) }
      it { expect(assigns(:link)).to be_valid }
      it { expect(response).to redirect_to(case_path(case_file)) }
     end

    context "when invalid" do
      before { xhr :post, :create, case_id: case_file, link: attributes_for(:link, :invalid) }
      it { expect(assigns(:link)).not_to be_valid }
    end
  end

  describe "DELETE destroy" do
    it "deletes a link" do
    	expect { delete :destroy, id: link , case_id: case_file }.
    	to change(Link, :count).by(-1) 
      expect(response).to redirect_to(case_path(case_file))
    end
  end
end
