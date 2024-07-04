class AddNotifyByEMailForNewComments < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :notify_by_email, :boolean, default: false, null: false
  end
end
