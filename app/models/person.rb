class Person < ActiveRecord::Base
  validates :name, :gender, presence: true
end
