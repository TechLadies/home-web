class Issue < ActiveRecord::Base
	belongs_to :case
	validates :case, presence: true
end