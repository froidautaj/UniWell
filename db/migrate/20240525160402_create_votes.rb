class CreateVotes < ActiveRecord::Migration[7.1]
  def change
    create_table :votes do |t|
      t.boolean :upvote, default: false
      t.boolean :downvote, default: false
      t.references :user, null: false, foreign_key: true, index: true
      t.references :votable, polymorphic: true, null: false, index: true

      t.timestamps
    end
  end
end
