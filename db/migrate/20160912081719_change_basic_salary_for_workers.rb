class ChangeBasicSalaryForWorkers < ActiveRecord::Migration
  def change
    rename_column :workers, :basic_salary, :basic_salary_per_month
    add_column :workers, :basic_salary_per_day, :decimal
  end
end
