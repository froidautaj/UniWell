json.extract! vote, :id, :upvote, :downvote, :user_id, :votable_id, :votable_type, :created_at, :updated_at
json.url vote_url(vote, format: :json)
