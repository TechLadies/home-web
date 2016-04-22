class Admin::AuditTrailsController < ApplicationController

  before_action :require_admin_authorization

  def index
    @versions = PaperTrail::Version.all
  end

end
