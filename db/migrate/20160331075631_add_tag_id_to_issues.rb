class AddTagIdToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :tag_id, :integer, default: 5
  end
end
