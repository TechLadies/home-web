class RenameCasesTableToCaseFiles < ActiveRecord::Migration
  def change
  	rename_table :cases, :case_files
  end
end
