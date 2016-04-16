class Involvement < ActiveRecord::Base

  belongs_to :case_file, foreign_key: :case_id, inverse_of: :involvements
  belongs_to :involvable, polymorphic: true

  enum role: [:client, :employer, :others]

# to check if case_id exists
  validates :case_file, presence: true

#  validates :case_id, uniqueness: { scope: :role }
#  validates :case_id, uniqueness: :true, if: :is_employer
#  validate :client_is_person

#private?

  def is_client
    role == 0
  end

  def is_employer
    role == 1
  end

#  def client_is_person
#  	unless (role == 0) && (involvable_type == "Person")
#			errors.add("Client must be Person") 
#  	end
#  end
 

#  validates_uniqueness_of	:involvable_id, scope: :case_id, conditions: -> { where.(role: 0) }
#  validates_uniqueness_of	:involvable_id, scope: :case_id, conditions: -> { where.(role: 1) }

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
