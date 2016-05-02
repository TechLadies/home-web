FactoryGirl.define do

  factory :domestic_worker do

    salary_details '$500 per month'
    nationality 'Indonesian'

    trait :invalid do
      salary_details ''
      nationality ''
    end

  end

end
