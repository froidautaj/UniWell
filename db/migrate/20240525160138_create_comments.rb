class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      # t.text :content Rich text content on comments
      t.references :user, null: false, foreign_key: true, index: true
      t.references :post, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
