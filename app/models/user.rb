class User < ActiveRecord::Base

  authenticates_with_sorcery!

  include AASM

  has_many :case_files

  validates :name, :email, presence: true

  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  enum status: [:active, :inactive]
#can we remove this?

  aasm column: :status, enum: true do

    state :active
    state :inactive, initial: true

    event :activate do
      transitions from: :inactive, to: :active
    end

    event :deactivate do
      transitions from: :active, to: :inactive
    end

  end
end
