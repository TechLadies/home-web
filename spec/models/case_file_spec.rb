require "rails_helper"

RSpec.describe CaseFile, type: :model do

  it { should belong_to(:user) }
  it { should have_many(:issues) }
  it { should have_many(:tags).through(:issues) }
  it { should have_many(:follow_ups) }
  it { should have_many(:links) }
  it { should have_many(:involvements) }
  it { should have_many(:people).through(:involvements) }
  it { should have_many(:organizations).through(:involvements) }
  it { should have_one(:worker) }

	it { should accept_nested_attributes_for(:worker).allow_destroy(true) }
	it { should accept_nested_attributes_for(:involvements) }
	it { should accept_nested_attributes_for(:issues) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:case_type) }
  it { should validate_presence_of(:status) }
 
#include aasm testing for :status
 #  case = CaseFile.new
 #  it { expect(case).to transition_from(:pending).to(:closed).on_event(:close) }
	# it { expect(case).to transition_from(:closed).to(:pending).on_event(:open) }

end
