class CaseSearchQuery < BaseQuery

  attr_accessor :query

  validates :query, presence: true

  def initialize(params={})
    super(params)
  end

  def perform
    if valid?
      @case_files = CaseFile.joins(:worker).where('workers.passport_number = ? OR workers.fin_number = ?', *([query] * 2))
      @case_files ||= @case_files.pending.order('id DESC')
    end
    @case_files ||= CaseFile.none
  end

  private

  def decorated_query
    "%#{@query}%"
  end

end
