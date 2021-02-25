FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.paragraph }
    content { Faker::Lorem.paragraph }
    priority { rand(0..3) }
    due_date { Faker::Date.between(from: 2.days.since, to: Date.today) }
  end
end
