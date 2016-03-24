class CaseFile < ActiveRecord::Base

  belongs_to :user
  belongs_to :organization
  has_many :issues, foreign_key: :case_id, inverse_of: :case_file
  has_many :follow_ups, foreign_key: :case_id, inverse_of: :case_file
  has_many :involvements, foreign_key: :case_id, inverse_of: :case_file
  has_many :documents, foreign_key: :case_id, inverse_of: :case_file
  has_many :people, through: :involvements

  accepts_nested_attributes_for :issues, reject_if: :all_blank, allow_destroy: true

  validates :user, :case_type, :status, presence: true

  TYPE = ["Domestic", "Non-Domestic"]
  STATUS = ["Pending", "Closed"]

end