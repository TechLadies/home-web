class CaseFile < ActiveRecord::Base

  belongs_to :user
  belongs_to :organization
  has_many :issues, foreign_key: :case_id, inverse_of: :case_file
  has_many :tags, through: :issues
  has_many :follow_ups, foreign_key: :case_id, inverse_of: :case_file
  has_many :involvements, foreign_key: :case_id, inverse_of: :case_file
  has_many :documents, foreign_key: :case_id, inverse_of: :case_file
  has_many :links
  has_many :people, through: :involvements
  has_paper_trail

  accepts_nested_attributes_for :involvements
  accepts_nested_attributes_for :issues, reject_if: proc { |a| a['description'].blank? }, allow_destroy: true

  validates :user, :case_type, :status, presence: true

  TYPE = ["Domestic", "Non-Domestic"]
  STATUS = ["Pending", "Closed"]

  before_validation :default_status

  scope :pending, -> { where(status: 'Pending') }
  scope :closed, -> { where(status: 'Closed') }

  protected

  def default_status
    self.status ||= "Pending"
  end

  def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << [:case_type,:status,:name,:issues]
    p all
    all.each do |casefile|
      csv << [casefile.case_type, casefile.status, casefile.user.name,casefile.issues.collect { |i| i.tag.name }.to_sentence]
    end
  end
end

end
