class CasesController < ApplicationController

  before_action :prepare_casefile, only: [:show, :edit, :update, :close, :reopen]
  before_action :require_admin_authorization, only: :reopen

  def index
    @cases = CaseFile.pending.order('id DESC').all
  end

  def archive
    @cases = CaseFile.closed.order('id DESC').all
  end

  def show
    @issues = @case.issues.order('id ASC')
  end

  def new
    @case = current_user.case_files.build
    @case.issues.build
    @case.build_worker
  end

  def create
    @case = current_user.case_files.build(case_params)
    if @case.save
      flash[:success] = "New Case Saved!"
      redirect_to case_path(@case)
    else
      render :new
    end
  end

  def edit
    @case.build_worker unless @case.worker
  end

  def update
    if @case.update_attributes(case_params)
      flash[:success] = "Case Updated!"
      redirect_to case_path(@case)
    else
      render :edit
    end
  end

  def close
    @service = CloseCaseFileService.new(@case)
    if @service.run_close
      flash[:notice] = "Case Closed!"
    else
      flash[:error] = @service.errors.full_messages.to_sentence
    end
    redirect_to case_path(@case)
  end

  def reopen
    @service = CloseCaseFileService.new(@case)
    if @service.run_open
      flash[:notice] = "Case reopened!"
    else
      flash[:error] = "Case cannot be reopened by non-admin personnel!"
    end
    redirect_to case_path(@case)
  end

  private

  def prepare_casefile
    @case = CaseFile.find(params[:id])
  end

  def case_params
    params.require(:case_file).permit(:case_type, :person_ids, issues_attributes: [:id, :description, :_destroy, :tag_id], worker_attributes: [:nationality, :passport_number, :start_of_employment, :fin_number, :pass_type, :previous_employers_details, :days_off, :loan_value, :remaining_loan_value, :salary_details, :basic_salary, :industry, :accomodation_type, :origin_agent_fee, :local_agent_fee, :weekly_working_hours, :sunday_working_hours])
  end

end
