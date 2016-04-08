class Issue < ActiveRecord::Base

  belongs_to :case_file, foreign_key: :case_id, inverse_of: :issues
  belongs_to :tag
  
  validates :case_file, presence: true

  accepts_nested_attributes_for :tag  

  has_paper_trail

end
