class RemoveDocuments < ActiveRecord::Migration

  def up
    drop_table :documents
  end

  def down
    create_table :documents do |t|
      t.integer :case_id
      t.string :file_url
      t.timestamps null: false
    end
  end

end
