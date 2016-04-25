FactoryGirl.define do

  factory :non_domestic_worker do

    basic_salary { rand(1..10) }

    trait :invalid do
	  basic_salary nil
    end

  end

end
