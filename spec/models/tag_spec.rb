require 'rails_helper'

RSpec.describe Tag, type: :model do

  it { is_expected.to belong_to(:parent) }
  it { is_expected.to have_many(:children) }

  it { is_expected.to have_many(:issues) }
  it { is_expected.to have_many(:case_files).through(:issues) }

  it { is_expected.to validate_presence_of(:name) }

end
