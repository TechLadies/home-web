require 'rails_helper'

RSpec.describe Link, type: :model do

  it { is_expected.to belong_to(:case_file) }

  it { is_expected.to validate_presence_of(:case_file) }
  it { is_expected.to validate_presence_of(:url) }

end
