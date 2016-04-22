require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many(:case_files) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_confirmation_of(:password) }
  it { should validate_presence_of(:password_confirmation) }

  it { should define_enum_for(:status).with([:active, :inactive]) }

end
