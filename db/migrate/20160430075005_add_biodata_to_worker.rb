class AddBiodataToWorker < ActiveRecord::Migration
  def change
    add_column :workers, :date_of_arrival, :date
    add_column :workers, :date_of_interview, :date
    add_column :workers, :interview_conducted_by, :string
  end
end
