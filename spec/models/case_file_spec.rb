require "rails_helper"

RSpec.describe CaseFile, type: :model do

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:issues) }
  it { is_expected.to have_many(:tags).through(:issues) }
  it { is_expected.to have_many(:follow_ups) }
  it { is_expected.to have_many(:links) }
  it { is_expected.to have_many(:involvements) }
  it { is_expected.to have_many(:people).through(:involvements) }
  it { is_expected.to have_many(:organizations).through(:involvements) }
  it { is_expected.to have_one(:worker) }

	it { is_expected.to accept_nested_attributes_for(:worker).allow_destroy(true) }
	it { is_expected.to accept_nested_attributes_for(:involvements) }
	it { is_expected.to accept_nested_attributes_for(:issues) }

  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:case_type) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_presence_of(:reported_at) }
 
#include aasm testing for :status
 #  case = CaseFile.new
 #  it { expect(case).to transition_from(:pending).to(:closed).on_event(:close) }
	# it { expect(case).to transition_from(:closed).to(:pending).on_event(:open) }

end
