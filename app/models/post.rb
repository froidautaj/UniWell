class Post < ApplicationRecord
  include Votable

  belongs_to :user
  belongs_to :category
  # has_many :votes, as: :votable, dependent: :destroy
  has_many :comments, dependent: :destroy
  # has_one :vote, -> (current_user) { where(user: current_user) }, as: :votable
  has_one :accepted_comment, class_name: 'Comment', primary_key: 'accepted_comment_id', dependent: :nullify
  has_one_attached :file
  validates :file, file: true

  has_rich_text :content
  has_one :action_text_rich_text, class_name: 'ActionText::RichText', as: :record
  attr_accessor :agree_terms

  # scope :toql_votes, -> { upvotes - downvotes }
  # scope :upvotes, -> { votes.where(upvote: true).count }
  # scope :downvotes, -> { votes.where(downvotes: true).count }

  validates :title, presence: true
  validates :content, presence: { message: "Can't be blank" }
  validate :profanity_filter
  validates :agree_terms, acceptance: true, presence: true, on: :create

  # def total_votes
  #   upvotes - downvotes
  # end
  #
  # def upvotes
  #   votes.where(upvote: true).count
  # end
  #
  # def downvotes
  #   votes.where(downvote: true).count
  # end

  # def total_comments
  #   comments.size
  # end

  def accepted_comment?(comment)
    accepted_comment_id == comment.id
  end

  def profanity_filter
    return unless title_changed? || self.attribute_changed?(:content)

    errors.add(:title, 'contains profanity') if ProfanityFilter.new.profane?(title)

    return unless ProfanityFilter.new.profane?(content.to_plain_text)

    errors.add(:content, 'contains profanity')
  end
end
