class Action < ActiveRecord::Base
  validates :case_id, :user_id, :organization_id, :status, :description, presence: true
end
