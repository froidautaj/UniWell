class RemoveCategoryDescription < ActiveRecord::Migration[7.1]
  def change
    remove_column :categories, :description
  end
end
