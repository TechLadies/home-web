class CaseSearchQuery

  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::AttributeMethods

  attr_accessor :start_date, :end_date

  validate :start_date_is_a_date
  validate :end_date_is_a_date

  def initialize(params={})
    super(params)
    self.start_date ||= 30.days.ago.to_date
    self.end_date ||= Date.today
  end

  def perform
    if valid?
      CaseFile.where(reported_at: start_date..end_date)
    else
      CaseFile.none
    end
  end

  private

  def start_date_is_a_date
    self.start_date = self.start_date.is_a?(Date) ? self.start_date : Date.parse(self.start_date)
  rescue ArgumentError
    errors.add(:start_date, 'is not a date')
  end

  def end_date_is_a_date
    self.end_date = self.end_date.is_a?(Date) ? self.end_date : Date.parse(self.end_date)
  rescue ArgumentError
    errors.add(:end_date, 'is not a date')
  end

end
