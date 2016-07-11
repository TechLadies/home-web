class AddRoleLabelToInvolvements < ActiveRecord::Migration
  def change
    add_column :involvements, :role_label, :string
  end
end
