class Involvement < ActiveRecord::Base

  belongs_to :case_file, foreign_key: :case_id, inverse_of: :involvements
  belongs_to :involvable, polymorphic: true

  enum role: [:client, :employer, :others]

  validates :case_file, presence: true
  #to add validations for roles

end
