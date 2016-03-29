class ChangeColumnToParentId < ActiveRecord::Migration
  def change
    rename_column :tags, :parent_tag_id, :parent_id
  end
end
