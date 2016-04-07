class CasesController < ApplicationController

  before_action :prepare_casefile, only: [:show, :edit, :update, :close]

  def index
    @cases = CaseFile.order('id DESC').all
  end

  def show
    @issues = @case.issues.order('id ASC')
  end

  def new
  	@case = current_user.case_files.build
    @case.issues.build
    @case.people.build
    @people = Person.all

    @tags = Tag.order('id ASC').all
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
    @people = Person.all
    @tags = Tag.order('id ASC').all
  end

  def update
    puts(case_params)
    if @case.update_attributes(case_params)
      flash[:success] = "Case Updated!"
      redirect_to case_path(@case)      	
    else
      render :edit
    end
  end

  def close
      @case.update(status: "Closed")
      flash[:notice] = "Case Closed!"
      redirect_to case_path(@case)
  end

  def update_people
    @case = CaseFile.find(params[:id])
    if @case.update_attributes(case_params)
      redirect_to case_path(@case)
    else
      render :update_people 
    end
  end


  private
    def prepare_casefile
      @case = CaseFile.find(params[:id])
      # puts @case.issues
      # puts @case.people
    end

    def case_params
      params.require(:case_file).permit(:case_type, :person_ids, issues_attributes: [:id, :description, :_destroy, :tag_id])
    end

end
