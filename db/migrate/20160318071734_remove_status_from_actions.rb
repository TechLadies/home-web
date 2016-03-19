class RemoveStatusFromActions < ActiveRecord::Migration
  def up
  	remove_column :actions, :status
  end

  def down
  	add_column :actions, :status, :string
  end
end
