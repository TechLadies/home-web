class Document < ActiveRecord::Base

  belongs_to :case

  validates :case, :file_url, presence: true

end
