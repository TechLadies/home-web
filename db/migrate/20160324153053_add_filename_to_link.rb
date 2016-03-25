class AddFilenameToLink < ActiveRecord::Migration
  def change
    add_column :links, :filename, :string
  end
end
