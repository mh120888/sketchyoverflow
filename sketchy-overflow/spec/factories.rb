FactoryGirl.define do
  factory :question do
    question { Faker::Lorem.sentence }
  end

  factory :answer do
    question { Faker::Lorem.sentence }
  end
end