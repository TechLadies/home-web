require 'rails_helper'

RSpec.describe InvolvementsController, type: :controller do

  let(:user) { build(:user) }
  before { login_user user }

  let(:case_file) { create(:case_file) }
  let!(:involvement) { create(:involvement, case_file: case_file) }

# need help for index

  describe "GET new" do
    before { xhr :get, :new, case_id: case_file, involvement: { involvable_type: 'Person', role: 'employer' } }
    it { expect(assigns(:form)).not_to be_nil }
    it { expect(response).to render_template(:new) }
  end

# need help for create

  describe "POST create" do

    # context "when valid" do
    #   before { xhr :post, :create, case_id: case_file, involvement: attributes_for(:involvement, :with_person) }
    #   it { expect(assigns(:involvement)).to be_valid }
    #   it { expect(response).to render_template(:create) }
    #  end

    # context "when invalid" do
    #   before { xhr :post, :create, case_id: case_file, involvement: attributes_for(:involvement, :invalid) }
    #   it { expect(assigns(:involvement)).not_to be_valid }
    #   it { expect(response).to render_template(:new) }
    # end

  end

  describe "DELETE destroy" do
    it "deletes an involvement" do
      expect { delete :destroy, id: involvement , case_id: case_file }.
      to change(Involvement, :count).by(-1)
      expect(response).to redirect_to(case_path(case_file))
    end
  end

end
