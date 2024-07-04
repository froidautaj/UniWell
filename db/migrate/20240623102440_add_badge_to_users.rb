class AddBadgeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :badge, :integer, default: 0
  end
end
