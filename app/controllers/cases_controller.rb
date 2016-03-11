class CasesController < ApplicationController

  def close
  	@case = Case.find(params[:id])
    @case.update(status: "Closed")
    flash[:success] = "Case Closed!"
    redirect_to @case
  end

  def index
    @cases = Case.all
  end

  def new
  	@case = Case.new
  end

  def create
  	@case = Case.new(case_params)
  	if @case.save
      flash[:success] = "New Case Saved!"
  	  redirect_to @case
  	else
  	  render 'new'
  	end
  end

  def show
  	@case = Case.find(params[:id])
  end

  def edit
  	@case = Case.find(params[:id])
  end

  def update
  	@case = Case.find(params[:id])
    if @case.update_attributes(case_params)
      flash[:success] = "Case Updated!"
      redirect_to @case      	
    else
      render 'edit'
    end
  end

  private

    def case_params
      params.require(:case).permit(:user_id, :organization_id, :case_type, :status)
    end   

end
