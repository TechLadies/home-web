require "rails_helper"

RSpec.describe Organization, type: :model do

  it { is_expected.to have_many(:case_files).through(:involvements) }
  it { is_expected.to have_many(:involvements) }

  it { is_expected.to validate_presence_of(:name) }
  
end