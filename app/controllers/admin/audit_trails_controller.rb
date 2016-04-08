class Admin::AuditTrailsController < ApplicationController

  def index
    @versions = PaperTrail::Version.all
  end

end
