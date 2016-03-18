class User < ActiveRecord::Base

  authenticates_with_sorcery!

  has_many :cases

  validates :name, :email, presence: true

end
