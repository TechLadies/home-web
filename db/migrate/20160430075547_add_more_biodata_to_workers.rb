class AddMoreBiodataToWorkers < ActiveRecord::Migration
  def change
    add_column :workers, :arrived_at, :date
    add_column :workers, :transfer_required, :boolean
    add_column :workers, :repatriation_required, :string
    add_column :workers, :translate_to, :string
    add_column :workers, :english_proficiency, :integer
    add_column :workers, :sleeping_area, :integer, array: true, default: []
  end
end
