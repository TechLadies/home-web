class User < ActiveRecord::Base

  authenticates_with_sorcery!

  has_many :case_files

  validates :name, :email, :password, presence: true

  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

end
