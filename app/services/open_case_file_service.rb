class OpenCaseFileService

  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::AttributeMethods

  validate :case_must_be_closed

  def initialize(case_file)
    @case_file = case_file
  end

  def run_open
    @case_file.open! if valid?
  end

  private

  def case_must_be_closed
    errors.add(:case_file, 'must be closed') unless @case_file.closed?
  end

end
