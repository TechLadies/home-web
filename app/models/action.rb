class Action < ActiveRecord::Base
  belongs_to :case
  validates :case_id, :user_id, :status, :description, presence: true
end
