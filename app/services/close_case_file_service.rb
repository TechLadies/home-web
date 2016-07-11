class CloseCaseFileService

  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::AttributeMethods

  attr_accessor :resolution

  validate :case_must_be_pending, :case_must_have_client_and_employer_and_agency
  validates :resolution, presence: true

  def initialize(case_file, params = {})
    @case_file = case_file
    self.resolution = params[:resolution] || @case_file.resolution
  end

  def run
    return false unless valid?
    @case_file.transaction do
      @case_file.update!(closed_at: Time.zone.now, resolution: resolution)
      @case_file.close!
    end
  end

  private

  def case_must_be_pending
    errors.add(:case_file, 'must be pending') unless @case_file.pending?
  end

  def case_must_have_client_and_employer_and_agency
    errors.add(:case_file, 'must have a client') unless @case_file.client
    errors.add(:case_file, 'must have an employer') unless @case_file.employer
    if @case_file.case_type == 'Domestic'
      errors.add(:case_file, 'must have an agency') unless @case_file.agency
    end
  end

end
