class RemoveUnecessaryColumns < ActiveRecord::Migration
  def up
    remove_column :actions, :organization_id
    remove_column :issues, :category
  end

  def down
    add_column :actions, :organization_id, :integer
    add_column :issues, :category, :string
  end
end
