class OrganizationSearchQuery < BaseQuery

  attr_accessor :query

  validates :query, presence: true

  def initialize(params={})
    super(params)
  end

  def perform
    if valid?
      @results = Organization.where('LOWER(name) LIKE ?', decorated_query.downcase)
    end
    @results ||= Organization.none
  end

  private

  def decorated_query
    "%#{@query}%"
  end

end
