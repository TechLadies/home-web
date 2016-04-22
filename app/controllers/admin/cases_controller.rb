class Admin::CasesController < ApplicationController

  before_action :require_admin_authorization
  before_action :prepare_casefile, only: :reopen

  def index
    @query = CaseSearchQuery.new(query_params)
    @case_files = @query.perform
    respond_to do |format|
      format.html
      format.csv { send_data @case_files.to_csv }
      format.xls
    end
  end

  def reassign
    @case_file = CaseFile.find(params[:id])
    @users = User.order('id DESC').all
  end

  def update_assignment
    @case_file = CaseFile.find(params[:id])
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
      flash[:error] = "Case cannot be reopened by non-admin personnel!"
    end
    redirect_to case_path(@case_file)
  end

  private

  def query_params
    params.has_key?(:query) ? params.require(:query).permit(:start_date, :end_date) : Hash.new
  end

  def case_params
    params.require(:case_file).permit(:user_id)
  end

  def prepare_casefile
    @case_file = CaseFile.find(params[:id])
  end

end
