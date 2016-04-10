class Involvement < ActiveRecord::Base

  belongs_to :case_file, foreign_key: :case_id, inverse_of: :involvements
  belongs_to :involvable, polymorphic: true

  enum role: [:Client, :Employer, :Others]

  validates :case_id, presence: true

#  to add validations for roles
#  -- BAD ATTEMPT --
#  validates :case_id, uniqueness: true, if: :role_is_client?
#  validates :case_id, uniqueness: true, if: :role_is_employer?

#	def role_is_client?
#		role == 0
#	end

#	def role_is_employer?
#		role == 1
#	end

end
