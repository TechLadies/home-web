require 'rails_helper'

RSpec.describe Link, type: :model do

  it { should belong_to(:case_file) }

  it { should validate_presence_of(:case_file) }
  it { should validate_presence_of(:url) }

end
