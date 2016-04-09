class AddColumnToCaseFile < ActiveRecord::Migration
  def change
    add_column :case_files, :reported_at, :datetime
  end
end
