class CleanupUsersTable < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :password if column_exists?(:users, :password)
    remove_column :users, :gender if column_exists?(:users, :gender)
    remove_column :users, :skill if column_exists?(:users, :skill)
    remove_column :users, :introduce if column_exists?(:users, :introduce)
    remove_column :users, :create_at if column_exists?(:users, :create_at)
    remove_column :users, :update_at if column_exists?(:users, :update_at)
    
    add_column :users, :img_url, :string unless column_exists?(:users, :img_url)
    add_column :users, :introduction, :text unless column_exists?(:users, :introduction)
    
    if column_exists?(:users, :img) && !column_exists?(:users, :img_url)
      rename_column :users, :img, :img_url
    elsif column_exists?(:users, :img)
      remove_column :users, :img
    end
  end
end
