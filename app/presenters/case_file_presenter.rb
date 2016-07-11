class CaseFilePresenter

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

end
