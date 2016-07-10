class AddResolutionToCaseFiles < ActiveRecord::Migration
  def change
    add_column :case_files, :resolution, :text
  end
end
