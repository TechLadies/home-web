class Involvement < ActiveRecord::Base

  belongs_to :case_file, foreign_key: :case_id, inverse_of: :involvements
  belongs_to :involvable, polymorphic: true

  enum role: [:client, :employer, :others]

  validates :case_file, :involvable, presence: true
  validates :involvable_id, uniqueness: { scope: [:involvable_type, :case_id] }

end
