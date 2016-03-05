class Person < ActiveRecord::Base
  has_many :organizations
  validates :name, :gender, presence: true
end
