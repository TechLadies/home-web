class Worker < ActiveRecord::Base

  belongs_to :case_file
  
  validates :nationality, presence: true

  enum english_proficiency: [:poor, :basic, :intermediate, :advanced]

end
