class CasesController < ApplicationController

  before_action :prepare_casefile, only: [:show, :edit, :update, :close]

  def index
    @cases = CaseFile.pending.order('id DESC').all
  end

  def archive
    @cases = CaseFile.closed.order('id DESC').all
  end

  def show
    @issues = @case.issues.order('id ASC')

    @involvements = @case.involvements

    if @involvements.where(role:0).blank?
      @client = nil
    else
      @client = Person.find([ @involvements.where(role: 0).first.involvable_id ]).first
    end

    if @involvements.where(role:1).blank?
      @employer = nil
    else
      if @involvements.where(role: 1).first.involvable_type == "Person"
        @employer = Person.find([ @involvements.where(role: 1).first.involvable_id ]).first
      else
        @employer = Organization.find([ @involvements.where(role: 1).first.involvable_id ]).first
      end
    end

    if @involvements.where(role:3).blank?
      @others = nil
    else
      @others = @involvements.where(role: 2)
    end
  end

  def new
    @case = current_user.case_files.build
    @case.issues.build
    @case.people.build
    @people = Person.all
    @tags = Tag.order('id ASC').all
    @case.build_worker
  end

  def create
    @case = current_user.case_files.build(case_params)
    if @case.save
      flash[:success] = "New Case Saved!"
      redirect_to case_path(@case)
    else
      @people = Person.all
      render :new
    end
        if @case.case_type == "Domestic"?
  end

  def edit
    @people = Person.all
  end

  def update
    if @case.update_attributes(case_params)
      flash[:success] = "Case Updated!"
      redirect_to case_path(@case)
    else
      @people = Person.all
      render :edit
    end
  end

  def close
    @service = CloseCaseFileService.new(@case)
    if @service.run
      flash[:notice] = "Case Closed!"
    else
      flash[:errors] = @service.errors.full_messages.to_sentence
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
