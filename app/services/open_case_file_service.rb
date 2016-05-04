class OpenCaseFileService

  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::AttributeMethods

  validate :case_must_be_closed

  def initialize(case_file)
    @case_file = case_file
  end

  def run
    if valid?
      @case_file.transaction do
        @case_file.update!(closed_at: nil)
        @case_file.open!
      end
    end
  end

  private

  def case_must_be_closed
    errors.add(:case_file, 'must be closed') unless @case_file.closed?
  end

end
