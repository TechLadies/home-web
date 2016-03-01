class Issue < ActiveRecord::Base
	validates :case, presence: true
end