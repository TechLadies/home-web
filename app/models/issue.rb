class Issue < ActiveRecord::Base

  belongs_to :case_file, foreign_key: :case_id, inverse_of: :issues
  has_paper_trail

  validates :case_file, presence: true

end
