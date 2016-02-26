class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :contact_number
      t.string :roles, array: true, default: []

      t.timestamps null: false
    end
  end
end
