class AddTotalCommentsToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :total_comments, :integer, default: 0
  end
end
