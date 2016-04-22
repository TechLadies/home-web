require 'rails_helper'

RSpec.describe Tag, type: :model do

  it { should belong_to(:parent) }
  it { should have_many(:children) }

  it { should have_many(:issues) }
  it { should have_many(:case_files).through(:issues) }

  it { should validate_presence_of(:name) }

end
