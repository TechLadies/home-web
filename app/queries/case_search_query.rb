class CaseSearchQuery

  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::AttributeMethods

  attr_accessor :start_date, :end_date, :case_type, :nationality, :status

  validate :start_date_is_a_date
  validate :end_date_is_a_date

  def initialize(params={})
    super(params)
    self.start_date ||= 30.days.ago.to_date
    self.end_date ||= Date.today
  end

  def perform
    if valid?
      @case_files = CaseFile.where(reported_at: start_date..end_date)
      @case_files = @case_files.where(case_type: case_type) if case_type.present?
      @case_files = @case_files.where(status: status) if status.present?
      @case_files = @case_files.joins(:worker).where(workers: { nationality: nationality }) if nationality.present?
    else
      @case_files = CaseFile.none
    end
    @case_files
  end

  private

  def start_date_is_a_date
    self.start_date = self.start_date.is_a?(Date) ? self.start_date : Date.strptime(self.start_date,"%d/%m/%Y")
  rescue ArgumentError
    errors.add(:start_date, 'is not a date')
  end

  def end_date_is_a_date
    self.end_date = self.end_date.is_a?(Date) ? self.end_date : Date.strptime(self.end_date,"%d/%m/%Y")
  rescue ArgumentError
    errors.add(:end_date, 'is not a date')
  end

end
