class Involvement < ActiveRecord::Base

  belongs_to :case
  belongs_to :person

  enum role: [:client, :employer, :others]

  validates :case, :person, presence: true

end
