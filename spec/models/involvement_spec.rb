require 'rails_helper'

RSpec.describe Involvement, type: :model do

  it { should belong_to(:case_file) }
  it { should belong_to(:involvable) }

  it { should define_enum_for(:role).with([:client, :employer, :others]) }

  it { should validate_presence_of(:case_file) }
  it { should validate_presence_of(:involvable) }
  it { should validate_uniqueness_of(:involvable_id).scoped_to(:involvable_type, :case_id) }

end
