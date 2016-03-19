class RenameActionToFollowUp < ActiveRecord::Migration
  def change
  	rename_table :actions, :follow_ups
  end

end
