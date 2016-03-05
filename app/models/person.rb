class Person < ActiveRecord::Base

  has_many :involvements
  has_many :cases, through: :involvements

  validates :name, :gender, presence: true

end
