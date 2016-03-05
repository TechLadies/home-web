class CreateInvolvements < ActiveRecord::Migration
  def change
    create_table :involvements do |t|
      t.references :person
      t.references :case
      t.integer :role

      t.timestamps null: false
    end
  end
end
