FactoryGirl.define do

  factory :case_file do

    user
    case_type 'Domestic'
    status :pending

    trait :invalid do
      user nil
      case_type ''
      status ''
    end
    
  end

end
