class Tag < ActiveRecord::Base

  belongs_to :parent, class_name: :Tag
  has_many :children, class_name: :Tag, foreign_key: :parent_id

  has_many :issues
  has_many :case_files, through: :issues

  validates :name, :description, presence: true

  scope :roots, -> { where(parent_id: nil) }

end