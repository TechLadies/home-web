class Tag < ActiveRecord::Base

  belongs_to :parent_tag, class_name: Tag
  has_many :children_tags, class_name: Tag, foreign_key: :parent_tag_id

  has_many: issues

end