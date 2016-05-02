FactoryGirl.define do

  factory :user do

    name 'John Doe'
    sequence(:email) { |n| "john.doe.#{n}@example.net" }
    password '123123123'
    password_confirmation '123123123'

    trait :invalid do
      name ''
      email ''
    end

    trait :admin do
      is_admin true
    end

    trait :active do
      status User.statuses[:active]
    end

    trait :inactive do
      status User.statuses[:inactive]
    end

  end

end
