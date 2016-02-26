class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.integer :user_id
      t.integer :organization_id
      t.string :case_type
      t.string :status

      t.timestamps null: false
    end
  end
end
