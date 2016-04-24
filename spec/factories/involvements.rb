FactoryGirl.define do

  factory :involvement do

    case_file

    association :involvable, factory: :person

    trait :invalid do
      case_file nil
    end

    trait :with_person do
      case_file
      association :involvable, factory: :person
    end

    trait :with_organization do
      case_file
      association :involvable, factory: :organization
    end

  end

end

