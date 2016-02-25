class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :contact_number
      t.array :roles

      t.timestamps null: false
    end
  end
end
