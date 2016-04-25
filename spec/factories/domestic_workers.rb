FactoryGirl.define do

  factory :domestic_worker do

    salary_details '$500 per month'

    trait :invalid do
	    salary_details ''
    end

  end

end
