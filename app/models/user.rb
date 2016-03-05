class User < ActiveRecord::Base

  has_many :cases

  validates :name, :email, presence: true

end
