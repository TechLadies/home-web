class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :case_id
      t.string :file_url
      t.timestamps null: false
    end
  end
end
