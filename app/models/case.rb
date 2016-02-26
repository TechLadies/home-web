class Case < ActiveRecord::Base
  validates :user_id, :organization_id, presence: true
end
