class Tag < ActiveRecord::Base

  has_ancestry

  validates :name, :description, presence: true

end