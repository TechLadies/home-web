class Involvement < ActiveRecord::Base

  belongs_to :case_file, foreign_key: :case_id, inverse_of: :involvements
  belongs_to :involvable, polymorphic: true

  enum role: [:client, :employer, :others]

  validates :case_id, presence: true
  validates_uniqueness_of	:role, scope: :case_id, conditions: -> { where.(role: 0) }
  validates_uniqueness_of	:role, scope: :case_id, conditions: -> { where.(role: 1) }

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
