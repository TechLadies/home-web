require 'rails_helper'

RSpec.describe Involvement, type: :model do

  it { is_expected.to belong_to(:case_file) }
  it { is_expected.to belong_to(:involvable) }

  it { is_expected.to define_enum_for(:role).with([:client, :employer, :others, :agency]) }

  it { is_expected.to validate_presence_of(:case_file) }
  it { is_expected.to validate_presence_of(:involvable) }

  # it { is_expected.to validate_uniqueness_of(:involvable_id).scoped_to(:involvable_type, :case_id) }

end
