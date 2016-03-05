class Case < ActiveRecord::Base

  belongs_to :user
  belongs_to :organization
  has_many :issues
  has_many :actions
  has_many :involvements
  has_many :people, through: :involvements

  validates :user, presence: true

end
