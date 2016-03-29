class RemoveParentIdFromTags < ActiveRecord::Migration
  def up
  	remove_column :tags, :parent_id
  end  

  def down
  	add_column :tags, :parent_id, :integer
  end
end
