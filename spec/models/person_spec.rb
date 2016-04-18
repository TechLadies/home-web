require 'rails_helper'

RSpec.describe Person, type: :model do

  it { is_expected.to have_many(:involvements) }
  it { is_expected.to have_many(:case_files).through(:involvements) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:gender) }

end
