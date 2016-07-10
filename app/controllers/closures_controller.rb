class ClosuresController < ApplicationController

  before_action :prepare_casefile

  def new
    @service = CloseCaseFileService.new(@case_file)
  end

  def create
    @service = CloseCaseFileService.new(@case_file, service_params)
    if @service.run
      flash[:notice] = "Case Closed!"
    else
      flash.now[:error] = @service.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def prepare_casefile
    @case_file = CaseFile.find(params[:case_id])
  end

  def service_params
    params.require(:service).permit(:resolution)
  end

end
