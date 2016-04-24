require 'rails_helper'

RSpec.describe InvolvementsController, type: :controller do

  let(:user) { build(:user) }
  before { login_user user }

  let(:case_file) { create(:case_file) }

  describe "GET new" do
    before { xhr :get, :new, case_id: case_file }
    it { expect(assigns(:involvement)).to be_a_new(Involvement) }
    it { expect(response).to render_template(:new) }
  end
 
  # describe "POST create" do

  #   context "when valid" do
  #     before { xhr :post, :create, case_id: case_file, involvement: attributes_for(:involvement) }
  #     it { expect(assigns(:involvement)).to be_valid }
  #     it { expect(response).to render_template(:create) }
  #    end
 
  #   context "when invalid" do
  #     before { xhr :post, :create, case_id: case_file, involvement: attributes_for(:involvement, :invalid) }
  #     it { expect(assigns(:involvement)).not_to be_valid }
  #     it { expect(response).to render_template(:new) }
  #   end

  # end

end
