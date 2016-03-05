class Organization < ActiveRecord::Base

  has_many :people
  has_many :cases

  validates :name, presence: true

end
