class Worker < ActiveRecord::Base

  belongs_to :case_file
  
  validates :nationality, presence: true

end
