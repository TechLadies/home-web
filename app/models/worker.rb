class Worker < ActiveRecord::Base

  belongs_to :case_file

  validates :case_file, presence: true
  validate :nationality_cannot_be_others

  enum english_proficiency: [:poor, :basic, :intermediate, :advanced]

  private

  def nationality_cannot_be_others
    errors.add(:nationality, "Please specify nationality") if nationality == 'Others' || nationality.blank?
  end

end
