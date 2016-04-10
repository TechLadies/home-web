class Involvement < ActiveRecord::Base

  belongs_to :case_file
  belongs_to :involvable, polymorphic: true

  enum role: [:client, :employer, :others]

  accepts_nested_attributes_for :person
  validates :case_file, :person, presence: true

end
