class FollowUp < ActiveRecord::Base

  belongs_to :case_file
  belongs_to :user

  validates :case_file, :user, :description, presence: true

end
