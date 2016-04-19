class Admin::CasesController < ApplicationController

  before_action :require_admin_authorization
  before_action :prepare_casefile, only: :reopen

  def index
    @query = CaseSearchQuery.new(query_params)
    @cases = @query.perform
    respond_to do |format|
      format.html
      format.csv { send_data @cases.to_csv }
      format.xls
    end
  end

  def reassign
    @case = CaseFile.find(params[:id])
    @users = User.order('id DESC').all
  end

  def update_assignment
    @case = CaseFile.find(params[:id])
    if @case.update_attributes(case_params)
      redirect_to case_path(@case)
    else
      render :reassign
    end
  end

  def reopen
    @service = OpenCaseFileService.new(@case)
    if @service.run_open
      flash[:notice] = "Case Reopened!"
    else
      flash[:error] = "Case cannot be reopened by non-admin personnel!"
    end
    redirect_to case_path(@case)
  end

  private

  def query_params
    params.has_key?(:query) ? params.require(:query).permit(:start_date, :end_date) : Hash.new
  end

  def case_params
    params.require(:case_file).permit(:user_id)
  end

  def prepare_casefile
    @case = CaseFile.find(params[:id])
  end

end
