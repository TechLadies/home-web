class CasesController < ApplicationController

  before_action :prepare_case, only: [:show, :edit, :update, :close]

  def index
    @cases = Case.all
  end

  def show
  end

  def new
  	@case = current_user.cases.build
  end

  def create
    @case = current_user.cases.build(case_params)
  	if @case.save
      flash[:success] = "New Case Saved!"
  	  redirect_to @case
  	else
  	  render :new
  	end
  end

  def edit
  end

  def update
    if @case.update_attributes(case_params)
      flash[:success] = "Case Updated!"
      redirect_to @case      	
    else
      render :edit
    end
  end

  def close
    @case.update(status: "Closed")
    flash[:success] = "Case Closed!"
    redirect_to @case
  end

  private

  def case_params
    params.require(:case).permit(:organization_id, :case_type, :status)
  end

  def prepare_case
    @case = Case.find(params[:id])
  end

end
