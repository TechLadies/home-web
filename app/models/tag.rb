class Tag < ActiveRecord::Base

  belongs_to :parent, class_name: :Tag
  has_many :children, class_name: :Tag, foreign_key: :parent_id

  has_many :issues
  has_many :case_files, through: :issues

  validates :name, presence: true

  scope :roots, -> { where(parent_id: nil) }

  def self.traverse(tags = Tag.roots, level = 0, &block)
    tags.each do |tag|
      block.call tag, level
      traverse(tag.children, level + 1, &block) unless tag.children.empty?
    end
  end

end