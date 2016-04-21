require "rails_helper"

RSpec.describe Organization, type: :model do

  it { should have_many(:case_files).through(:involvements) }
  it { should have_many(:involvements) }

  it { should validate_presence_of(:name) }
  
end