FactoryBot.define do
  factory :vote do
    upvote { false }
    downvote { false }
    user
  end
end
