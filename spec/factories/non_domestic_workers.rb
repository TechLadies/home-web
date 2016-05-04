FactoryGirl.define do

  factory :non_domestic_worker do

    nationality 'Indonesian'
    case_file

    trait :invalid do
      nationality ''
      case_file nil      
    end

  end

end
