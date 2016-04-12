class ChangeInvolvementsToPolymorphic < ActiveRecord::Migration
  def change
  	change_table :involvements do |t|
		  t.remove :person_id
		  t.references :involvable, polymorphic: true, index: true
		end
  end
end
