require 'rails_helper'

RSpec.describe ClosuresController, type: :controller do

  let(:user) { build(:user) }
  before { login_user user }

  let(:case_file) { create(:case_file, worker: create(:domestic_worker)) }

  let!(:client) { create(:involvement, :with_client, case_file: case_file) }
  let!(:agency) { create(:involvement, :with_agency, case_file: case_file) }
  let!(:employer) { create(:involvement, :with_employer, case_file: case_file) }

  describe "GET new" do
    before { xhr :get, :new, case_id: case_file }
    it { expect(assigns(:service)).not_to be_nil }
    it { expect(response).to render_template(:new) }
    it { expect(case_file).to be_pending }
  end

  describe "POST create" do

    context "when valid" do
      before { xhr :post, :create, case_id: case_file, service: { resolution: 'case was resolved blah blah' } }
      it { expect(assigns(:service).errors).to be_empty }
      it { expect(response).to render_template(:create) }
      it { expect(case_file.reload).to be_closed }
     end

    context "when invalid" do
      before { xhr :post, :create, case_id: case_file, service: { resolution: '' } }
      it { expect(assigns(:service).errors).not_to be_empty }
      it { expect(assigns(:service).resolution).to be_blank }
      it { expect(response).to render_template(:new) }
      it { expect(case_file.reload).to be_pending }
    end

  end

end
