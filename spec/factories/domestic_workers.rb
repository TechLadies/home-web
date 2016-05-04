FactoryGirl.define do

  factory :domestic_worker do

    nationality 'Indonesian'
    case_file

    trait :invalid do
      nationality ''
      case_file nil
    end

  end

end
