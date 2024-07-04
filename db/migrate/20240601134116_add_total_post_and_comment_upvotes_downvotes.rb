class AddTotalPostAndCommentUpvotesDownvotes < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :total_upvotes, :integer, default: 0
    add_column :posts, :total_downvotes, :integer, default: 0

    add_column :comments, :total_upvotes, :integer, default: 0
    add_column :comments, :total_downvotes, :integer, default: 0
  end
end
