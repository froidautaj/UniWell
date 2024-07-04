# frozen_string_literal: true

class Vote < ApplicationRecord # :nodoc:
  belongs_to :user, foreign_key: :user_id
  belongs_to :votable, polymorphic: true
end
