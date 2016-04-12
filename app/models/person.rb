class Person < ActiveRecord::Base

  has_many :case_files, through: :involvements
  has_many :involvements, as: :involvable, dependent: :destroy

  validates :name, :gender, presence: true

end
