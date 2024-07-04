class AddAcceptedCommentToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :accepted_comment, foreign_key: { to_table: :comments }, null: true, index: true
  end
end
