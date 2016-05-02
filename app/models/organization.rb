class Organization < ActiveRecord::Base

  has_many :case_files, through: :involvements
  has_many :involvements, as: :involvable, dependent: :destroy

  validates :name, presence: true

  INDUSTRY = ['Agency', 'Marine', 'Services', 'Manufacturing', 'Conservancy', 'Landscape Works', 'Others']

end
