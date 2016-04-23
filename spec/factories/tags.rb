FactoryGirl.define do

  factory :tag do

  	id 1
    name 'Tag Test 1'
    parent_id 2

    trait :invalid do
    	id 1
	    name ''
	    parent_id 1
    end

  end

end
