class SorceryCore < ActiveRecord::Migration


  def up
    change_column :users, :email, :string, null: false
    add_index :users, :email, unique: true
  end

  def down
    remove_index :users, :email
    change_column :users, :email, :string
  end

 end
