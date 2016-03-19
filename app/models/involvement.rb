class Involvement < ActiveRecord::Base

  belongs_to :case_file
  belongs_to :person

  enum role: [:client, :employer, :others]

  validates :case_file, :person, presence: true

end
