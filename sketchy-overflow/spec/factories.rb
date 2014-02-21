FactoryGirl.define do
  factory :question do
    title { Faker::Lorem.word }
    content { Faker::Lorem.sentence }
  end

  factory :answer do
    content { Faker::Lorem.sentence }
  end
end