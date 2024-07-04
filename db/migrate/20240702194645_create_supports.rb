class CreateSupports < ActiveRecord::Migration[7.1]
  def change
    create_table :supports do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.text :message

      t.timestamps
    end
  end
end
