class Case < ActiveRecord::Base
  belongs_to :user
  has_many :issues
  has_many :actions
  validates :user_id, :organization_id, presence: true
end
