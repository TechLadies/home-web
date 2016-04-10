class Involvement < ActiveRecord::Base

  belongs_to :case_file
  belongs_to :involvable, polymorphic: true

  enum role: [:client, :employer, :others]

  validates :case_file, presence: true
  #to add validations for roles

end
