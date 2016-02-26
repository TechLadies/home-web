class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.integer :case_id
      t.integer :user_id
      t.integer :organization_id
      t.text :description
      t.string :status
      t.timestamps null: false
    end
  end
end
