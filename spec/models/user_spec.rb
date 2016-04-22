require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to have_many(:case_files) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_confirmation_of(:password) }
  it { is_expected.to validate_presence_of(:password_confirmation) }

  it { is_expected.to define_enum_for(:status).with([:active, :inactive]) }

  it { expect(subject).to transition_from(:active).to(:inactive).on_event(:deactivate) }
  it { expect(subject).to transition_from(:inactive).to(:active).on_event(:activate) }


end
