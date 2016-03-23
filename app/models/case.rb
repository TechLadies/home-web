class Case < ActiveRecord::Base

  belongs_to :user
  belongs_to :organization
  has_many :issues
  has_many :follow_ups
  has_many :involvements
  has_many :people, through: :involvements
  has_many :documents
  has_many :links

  validates :user, presence: true

end
