FactoryGirl.define do

  factory :organization do

    name 'ABC Company'

    trait :invalid do
			name ''
    end

  end

end
