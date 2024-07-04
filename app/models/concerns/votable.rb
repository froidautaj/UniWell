# frozen_string_literal: true

module Votable # :nodoc:
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :votable, dependent: :destroy
  end

  def vote(user)
    votes.where(user:).first
  end

  def upvoted?(user)
    vote(user)&.upvote
  end

  def downvoted?(user)
    vote(user)&.downvote
  end

  def find_or_create_vote(user)
    vote(user) || votes.create(user:)
  end

  def toggle_upvote(user)
    model_vote = find_or_create_vote(user)

    self.increment!(:total_upvotes, model_vote.upvote ? -1 : 1)
    self.decrement!(:total_downvotes, 1) if model_vote.downvote

    model_vote.upvote = !model_vote.upvote
    model_vote.downvote = false
    model_vote.save
  end

  def toggle_downvote(user)
    model_vote = find_or_create_vote(user)

    self.increment!(:total_downvotes, model_vote.downvote ? -1 : 1)
    self.decrement!(:total_upvotes, 1) if model_vote.upvote

    model_vote.upvote = false
    model_vote.downvote = !model_vote.downvote
    model_vote.save
  end

  def total_votes
    total_upvotes - total_downvotes
  end
end
