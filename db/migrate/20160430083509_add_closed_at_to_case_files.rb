class AddClosedAtToCaseFiles < ActiveRecord::Migration
  def change
    add_column :case_files, :closed_at, :datetime
  end
end
