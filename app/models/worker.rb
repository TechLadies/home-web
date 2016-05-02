class Worker < ActiveRecord::Base

  validates :nationality, presence: true

end
