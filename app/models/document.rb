class Document < ActiveRecord::Base

  belongs_to :case_file

  validates :case_file, :file_url, presence: true

end
