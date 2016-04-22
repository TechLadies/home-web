require 'rails_helper'

RSpec.describe FollowUp, type: :model do

  it { should belong_to(:case_file) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:case_file) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:description) }

end
