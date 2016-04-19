class CloseCaseFileService

  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::AttributeMethods

  validate :case_must_be_pending, :case_must_have_client_and_employer

  def initialize(case_file)
    @case_file = case_file
  end

  def run
    @case_file.close! if valid?
  end

  private

  def case_must_be_pending
    errors.add(:case_file, 'must be pending') unless @case_file.pending?
  end

  def case_must_have_client_and_employer
    errors.add(:case_file, 'must have a client') unless @case_file.client
    errors.add(:case_file, 'must have an employer') unless @case_file.employer
  end

end
