class AddWpNumbertoWorkers < ActiveRecord::Migration
  def change
    add_column :workers, :wp_number, :string
  end
end
