FactoryGirl.define do

  factory :follow_up do

    case_file 
    user
    description 'Follow Up factory test'

    trait :invalid do
	    case_file nil
	    user nil
	    description ''
    end

  end

end
