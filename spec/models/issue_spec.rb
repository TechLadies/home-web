require 'rails_helper'

RSpec.describe Issue, type: :model do

  it { should belong_to(:case_file) }
  it { should belong_to(:tag) }

  it { should validate_presence_of(:case_file) }
  it { should validate_uniqueness_of(:tag_id).scoped_to(:case_id) }

	it { should accept_nested_attributes_for(:tag) }

end
