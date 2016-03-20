class User < ActiveRecord::Base

  authenticates_with_sorcery!

  has_many :case_files

  validates :name, :email, :password, presence: true

end
