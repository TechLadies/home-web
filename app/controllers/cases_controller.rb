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
<<<<<<< HEAD
    @case.people.build
    @people = Person.all
=======
    @tags = Tag.order('id ASC').all
>>>>>>> 010df0c28ceed06ce7bba8a4e15d53403bf5e4fd
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
<<<<<<< HEAD
    @people = Person.all
=======
    @tags = Tag.order('id ASC').all
>>>>>>> 010df0c28ceed06ce7bba8a4e15d53403bf5e4fd
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

  private

<<<<<<< HEAD
  def case_params
    params.require(:case_file).permit(:case_type, :person_id, issues_attributes: [:id, :description, :_destroy])
  end

=======
>>>>>>> 010df0c28ceed06ce7bba8a4e15d53403bf5e4fd
  def prepare_casefile
    @case = CaseFile.find(params[:id])
    # puts @case.issues
    # puts @case.people
  end

  def case_params
    params.require(:case_file).permit(:case_type, issues_attributes: [:id, :description, :_destroy, :tag_id])
  end

end
