class Person < ActiveRecord::Base

  has_many :involvements
  has_many :case_files, through: :involvements

  validates :name, :gender, presence: true

end
