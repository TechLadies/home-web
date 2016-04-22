require 'rails_helper'

RSpec.describe FollowUp, type: :model do

  it { is_expected.to belong_to(:case_file) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:case_file) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:description) }

end
