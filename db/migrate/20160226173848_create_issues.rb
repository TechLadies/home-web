class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :case_id
      t.string :category
      t.text :description

      t.timestamps null: false
    end
  end
end
