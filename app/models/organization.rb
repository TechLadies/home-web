class Organization < ActiveRecord::Base

  has_many :people
  has_many :case_files, through: :involvements
  has_many :involvements, as: :involvable

  validates :name, presence: true

end
