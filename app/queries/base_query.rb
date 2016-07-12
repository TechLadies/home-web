class BaseQuery

  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::AttributeMethods
  include ActionView::Helpers::NumberHelper

  def initialize(params = {})
    params.each { |k, v| instance_variable_set("@#{k}",v) }
  end

end
