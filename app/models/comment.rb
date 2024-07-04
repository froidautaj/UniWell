class Comment < ApplicationRecord
  include Votable

  belongs_to :user
  belongs_to :post

  has_rich_text :content
  has_one_attached :file

  validates :file, file: true
  validates :content, presence: true
end
