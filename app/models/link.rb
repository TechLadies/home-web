class Link < ActiveRecord::Base

  belongs_to :case_file

  def image?
    filename.ends_with?('.png') || filename.ends_with?('.jpg') || filename.ends_with?('.gif') || filename.ends_with?('.jpeg')
  end

end
