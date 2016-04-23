FactoryGirl.define do

  factory :issue do

    case_file
	tag

    trait :invalid do
      case_file nil
    end

  end

end
