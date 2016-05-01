class CasesController < ApplicationController

  before_action :prepare_casefile, only: [:show, :edit, :update, :close]

  def index
    @case_files = CaseFile.pending.order('id DESC')
  end

  def archive
    @case_files = CaseFile.closed.order('id DESC')
  end

  def show
    @issues = @case_file.issues.order('id ASC')
  end

  def new
    @case_file = current_user.case_files.build
    @case_file.issues.build
    @case_file.people.build
    @case_file.build_worker
  end

  def create
    @case_file = current_user.case_files.build(case_params)
    if @case_file.save
      flash[:success] = "New Case Saved!"
      redirect_to case_path(@case_file)
    else
      render :new
    end
  end

  def edit
    if @case_file.closed?
      flash[:error] = "Case already closed! Contact Admin to reopen case for edit."
      redirect_to case_path(@case_file)
    else      
      @case_file.build_worker unless @case_file.worker
    end
  end

  def update
    if @case_file.update_attributes(case_params)
      flash[:success] = "Case Updated!"
      redirect_to case_path(@case_file)
    else
      render :edit
    end
  end

  def close
    @service = CloseCaseFileService.new(@case_file)
    if @service.run
      flash[:notice] = "Case Closed!"
    else
      flash[:error] = @service.errors.full_messages.to_sentence
    end
    redirect_to case_path(@case_file)
  end

  private

  def prepare_casefile
    @case_file = CaseFile.find(params[:id])
  end

  def case_params
    params[:case_file][:worker_attributes][:type] = "#{params[:case_file][:case_type].gsub('-', '')}Worker" if params[:case_file][:case_type]
    params.require(:case_file).permit(:case_type, :reported_at, :person_ids, issues_attributes: [:id, :description, :_destroy, :tag_id], worker_attributes: [:type, :nationality, :passport_number, :start_of_employment, :fin_number, :pass_type, :previous_employers_details, :days_off, :loan_value, :remaining_loan_value, :salary_details, :basic_salary, :industry, :accomodation_type, :origin_agent_fee, :local_agent_fee, :weekly_working_hours, :sunday_working_hours])
  end

end
