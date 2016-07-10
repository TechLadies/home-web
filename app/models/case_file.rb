class CaseFile < ActiveRecord::Base

  has_paper_trail

  belongs_to :user
  has_many :issues, foreign_key: :case_id, inverse_of: :case_file
  has_many :tags, through: :issues
  has_many :follow_ups, foreign_key: :case_id, inverse_of: :case_file
  has_many :links
  has_many :involvements, foreign_key: :case_id, inverse_of: :case_file
  has_many :people, through: :involvements, source: :involvable, source_type: "Person"
  has_many :organizations, through: :involvements, source: :involvable, source_type: "Organization"
  has_one :worker

  accepts_nested_attributes_for :worker, allow_destroy: true
  accepts_nested_attributes_for :involvements
  accepts_nested_attributes_for :issues, reject_if: proc { |a| a['description'].blank? }, allow_destroy: true

  validates :user, :case_type, :status, :reported_at, presence: true

  TYPE = ['Domestic', 'Non-Domestic']

  include AASM

  aasm column: :status do

    state :pending, initial: true
    state :closed

    event :close do
      transitions from: :pending, to: :closed
    end

    event :open do
      transitions from: :closed, to: :pending
    end

  end

  def to_s
    "##{id} #{[client&.involvable&.name, employer&.involvable&.name].compact.join(' v ')}"
  end

  def client
    involvements.client.first
  end

  def employer
    involvements.employer.first
  end

  def agency
    involvements.agency.first
  end

  def others
    involvements.others
  end

  def domestic?
    case_type == 'Domestic'
  end

  def non_domestic?
    case_type == 'Non-Domestic'
  end

  protected

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << [:case_id, :case_assigned_to, :client, :employer, :agency, :case_type, :case_status, :case_reported_at, :issues]
      all.each do |casefile|
        csv << [casefile.id, casefile.user.name, casefile&.client&.involvable&.name, casefile&.employer&.involvable&.name,  casefile&.agency&.involvable&.name, casefile.case_type, casefile.status, casefile.reported_at&.to_date, casefile.issues.collect { |i| i.tag.name }.to_sentence]
      end
    end
  end

end
