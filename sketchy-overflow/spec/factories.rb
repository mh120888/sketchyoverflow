FactoryGirl.define do
  factory :question do
    content { Faker::Lorem.sentence }
  end

  factory :answer do
    content { Faker::Lorem.sentence }
  end
end