class FollowUp < ActiveRecord::Base

  belongs_to :case
  belongs_to :user

  validates :case, :user, :description, presence: true

end
