FactoryGirl.define do

  factory :involvement do

    case_file

    association :involvable, factory: :person

    trait :invalid do
      case_file nil
    end

    trait :with_person do
      association :involvable, factory: :person
    end

    trait :with_client do
      role Involvement.roles[:client]
      association :involvable, factory: :person
    end

    trait :with_employer do
      role Involvement.roles[:employer]
      association :involvable, factory: :person
    end

    trait :with_organization do
      association :involvable, factory: :organization
    end

    trait :with_agency do
      role Involvement.roles[:agency]
      association :involvable, factory: :organization
    end

  end

end
