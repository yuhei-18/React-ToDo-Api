FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.paragraph }
    content { Faker::Lorem.paragraph }
  end
end
