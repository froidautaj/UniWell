class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      # t.text :content rich_text :content from model
      t.string :tags, array: true, index: { using: 'gin' }
      t.bigint :views, default: 0
      t.references :user, null: false, foreign_key: true, index: true
      t.references :category, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end

