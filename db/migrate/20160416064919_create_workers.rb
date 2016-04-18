class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :type
      t.integer :person_id
      t.integer :organization_id
      t.string :nationality
      t.string :passport_number
      t.string :fin_number
      t.string :pass_type
      t.date :start_of_employment
      t.text :previous_employers_details
      t.integer :days_off
      t.integer :loan_value
      t.integer :remaining_loan_value
      t.text :salary_details
      t.decimal :basic_salary
      t.string :industry
      t.string :accomodation_type
      t.decimal :origin_agent_fee
      t.decimal :local_agent_fee
      t.integer :weekly_working_hours
      t.integer :sunday_working_hours
      t.integer :case_file_id

      t.timestamps null: false
    end
  end
end
