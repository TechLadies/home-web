class AddFieldsToLinks < ActiveRecord::Migration
  def change
    add_column :links, :mimetype, :string
    add_column :links, :size, :integer
  end
end
