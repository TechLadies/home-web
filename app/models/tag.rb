class Tag < ActiveRecord::Base

  belongs_to :parent, class_name: :Tag
  has_many :children, class_name: :Tag, foreign_key: :parent_id

  has_many :issues
  has_many :case_files, through: :issues

  validates :name, presence: true

  validate :cannot_be_tagged_under_itself

  scope :roots, -> { where(parent_id: nil) }

  private

  def cannot_be_tagged_under_itself
    errors.add(:parent_id, 'cannot be equal to own id') if parent_id == id
  end

end