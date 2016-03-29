class Tag < ActiveRecord::Base

  belongs_to :parent, class_name: :Tag
  has_many :children, class_name: :Tag, foreign_key: :parent_tag_id

  validates :name, :description, presence: true

end