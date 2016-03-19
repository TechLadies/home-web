class Organization < ActiveRecord::Base

  has_many :people
  has_many :case_files

  validates :name, presence: true

end
