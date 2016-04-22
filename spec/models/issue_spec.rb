require 'rails_helper'

RSpec.describe Issue, type: :model do

  it { is_expected.to belong_to(:case_file) }
  it { is_expected.to belong_to(:tag) }

  it { is_expected.to validate_presence_of(:case_file) }
  it { is_expected.to validate_uniqueness_of(:tag_id).scoped_to(:case_id) }

  it { is_expected.to accept_nested_attributes_for(:tag) }

end
