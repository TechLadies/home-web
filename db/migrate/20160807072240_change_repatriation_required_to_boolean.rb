class ChangeRepatriationRequiredToBoolean < ActiveRecord::Migration
  def change
    change_column :workers, :repatriation_required, 'boolean USING CAST(repatriation_required AS boolean)'
  end
end
