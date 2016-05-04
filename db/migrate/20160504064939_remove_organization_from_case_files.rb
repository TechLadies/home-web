class RemoveOrganizationFromCaseFiles < ActiveRecord::Migration
  def change
  	remove_column :case_files, :organization_id
  end
end
