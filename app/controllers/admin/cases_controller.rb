class Admin::CasesController < ApplicationController

  before_action :require_admin_authorization
  before_action :prepare_casefile, only: [:reassign, :update_assignment, :reopen]

  def index
    @query = GeneralReportQuery.new(query_params)
    @case_files = @query.perform.order('reported_at DESC')
    respond_to do |format|
      format.html
      format.csv { send_data @case_files.to_csv }
      format.xls
    end
  end

  def reassign
    @users = User.order('id DESC').all
  end

  def update_assignment
    if @case_file.update_attributes(case_params)
      redirect_to case_path(@case_file)
    else
      render :reassign
    end
  end

  def reopen
    @service = OpenCaseFileService.new(@case_file)
    if @service.run
      flash[:notice] = "Case Reopened!"
    else
      flash[:error] = @service.errors.full_messages.to_sentence
    end
    redirect_to case_path(@case_file)
  end

  private

  def query_params
    params.has_key?(:query) ? params.require(:query).permit(:start_date, :end_date, :case_type, :nationality, :status) : Hash.new
  end

  def case_params
    params.require(:case_file).permit(:user_id)
  end

  def prepare_casefile
    @case_file = CaseFile.find(params[:id])
  end

end
