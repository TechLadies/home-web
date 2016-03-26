class ChangeColumnToUsers < ActiveRecord::Migration
  def up
    remove_column :users, :roles
    add_column :users, :is_admin, :boolean
    add_column :users, :status, :integer
  end

  def down
    remove_column :users, :status
    remove_column :users, :is_admin
    add_column :users, :roles, :string
  end
end
