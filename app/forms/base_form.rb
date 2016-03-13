class BaseForm

  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::AttributeMethods

  include ActionView::Helpers::NumberHelper

  def initialize(params={})
    super(params)
  end

end
