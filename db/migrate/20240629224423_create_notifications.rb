class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :title
      t.string :content
      t.string :link
      t.boolean :read, default: false, null: false

      t.timestamps
    end
  end
end
