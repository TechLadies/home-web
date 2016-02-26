class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.date :date_of_birth
      t.string :phone
      t.string :email
      t.text :address
      t.string :gender
      # to add organization_id? #
      t.timestamps null: false
    end
  end
end
