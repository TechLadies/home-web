FactoryGirl.define do

  factory :person do

    name 'Jolovan W'
    gender 'Male'

    trait :invalid do
      name ''
      gender ''
    end

  end

end
