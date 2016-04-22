FactoryGirl.define do

  factory :case_file do

    user
    # organization

    case_type 'Domestic'

    trait :invalid do
      user nil
      case_type ''
    end

  end

end
