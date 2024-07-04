FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    tags { Faker::Lorem.words(number: 4) }
    views { 0 }
    accepted_comment_id { nil }
    user
    category
  end
end
