FactoryGirl.define do

  factory :case_file do

    user
    case_type 'Domestic'
    reported_at { Date.today - 10.days }

    status :pending

    trait :invalid do
      user nil
      case_type ''
      status ''
    end
        
  end

end
