class Issue < ActiveRecord::Base

  belongs_to :case_file, foreign_key: :case_id, inverse_of: :issues
  belongs_to :tag
  
  validates :case_file, presence: true

end