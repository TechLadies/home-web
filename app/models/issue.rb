class Issue < ActiveRecord::Base

  belongs_to :case_file, foreign_key: :case_id, inverse_of: :issues
  belongs_to :tag
  
  validates :case_file, presence: true
  validates :tag_id, uniqueness: { scope: :case_id }

  accepts_nested_attributes_for :tag

  has_paper_trail

end
