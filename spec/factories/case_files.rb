FactoryGirl.define do

  factory :case_file do

    user
    # organization

    case_type 'Domestic'
    reported_at { Date.today - 10.days }

    trait :invalid do
      user nil
      case_type ''
    end

  end

end
