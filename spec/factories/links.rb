FactoryGirl.define do

  factory :link do

		case_file
		url 'www.google.com'
		
    trait :invalid do
	    case_file nil
	    url ''
    end

  end

end
