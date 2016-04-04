class FollowUp < ActiveRecord::Base

  belongs_to :case_file, foreign_key: :case_id, inverse_of: :follow_ups
  belongs_to :user
  has_paper_trail

  validates :case_file, :user, :description, presence: true

end
