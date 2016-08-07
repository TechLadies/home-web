class CaseFilePresenter

  include ActionView::Helpers::NumberHelper
  include ActionView::Helpers::TextHelper

  attr_reader :case_file

  def initialize(case_file)
    @case_file = case_file
    @tabs = { biodata: { title: 'Client Biodata', badge: nil }, issues: { title: 'Issues', badge: issues.count }, followups: { title: 'Follow Ups', badge: @case_file.follow_ups.count }, related: { title: 'People/Organizations', badge: @case_file.involvements.others.count }, documents: { title: 'Documents', badge: @case_file.links.count } }
  end

  def issues
    @issues ||= case_file.issues.order('id ASC')
  end

  def follow_ups
    @follow_ups ||= case_file.follow_ups.order(created_at: :desc)
  end

  def related_parties
    @related_parties ||= case_file.involvements.others
  end

  def tabs
    @tabs.each do |key, values|
      yield key, values[:title], values[:badge]
    end
  end

  # basic biodata

  def nationality
    case_file.worker&.nationality
  end

  def fin_number
    case_file.worker&.fin_number
  end

  def passport_number
    case_file.worker&.passport_number
  end

  def pass_type
    case_file.worker&.pass_type
  end

  def date_of_arrival
    case_file.worker&.date_of_arrival&.to_date&.to_formatted_s(:long)
  end

  def start_of_employment
    case_file.worker&.start_of_employment&.to_date&.to_formatted_s(:long)
  end

  def days_off
    case_file.worker&.days_off
  end

  def previous_employers_details
    case_file.worker&.previous_employers_details
  end

  # domestic workers

  def date_of_arrival
    case_file.worker&.arrived_at&.to_date&.to_formatted_s(:long)
  end

  def interview_conducted_by
    case_file.worker&.interview_conducted_by
  end

  def date_of_interview
    case_file.worker&.date_of_interview&.to_date&.to_formatted_s(:long)
  end

  def preferred_language
    case_file.worker&.translate_to
  end

  def transfer_required?
    case_file.worker&.transfer_required? ? 'Yes' : 'No'
  end

  def repatriation_required?
    case_file.worker&.repatriation_required.blank? ? 'No' : "Repatriation to #{case_file.worker&.repatriation_required}"
  end

  def english_proficiency
    case_file.worker&.english_proficiency&.titleize
  end

  def loan_value
    number_to_currency case_file.worker&.loan_value
  end

  def remaining_loan_value
    number_to_currency case_file.worker&.remaining_loan_value
  end

  def salary_details
    case_file.worker&.salary_details
  end

  def sleeping_area
    case_file.worker&.sleeping_area&.reject(&:blank?)&.map { |i| DomesticWorker::SLEEPING_AREAS[i] }&.to_sentence
  end

  # domestic workers

  def basic_salary
    number_to_currency case_file.worker&.basic_salary
  end

  def industry
    case_file.worker&.industry
  end

  def accomodation_type
    case_file.worker&.accomodation_type
  end

  def origin_agent_fee
    number_to_currency case_file.worker&.origin_agent_fee
  end

  def local_agent_fee
    number_to_currency case_file.worker&.local_agent_fee
  end

  def weekly_working_hours
    "#{pluralize(case_file.worker&.weekly_working_hours, 'hour')} everyday"
  end

  def sunday_working_hours
    "#{pluralize(case_file.worker&.sunday_working_hours, 'hour')} on Sunday"
  end

end
