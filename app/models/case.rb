class Case < ActiveRecord::Base
  has_many :issues
  validates :user_id, :organization_id, presence: true
end
