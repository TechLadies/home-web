class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.text :name
      t.integer :parent_tag_id, default: nil
      t.text :description

      t.timestamps null: false
    end
  end
end