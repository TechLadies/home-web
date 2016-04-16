class InvolvementsController < ApplicationController

  before_action :prepare_case_file
#before_action: check if case is already closed

  def new
    @involvement = @case_file.involvements.build(involvement_params)
  end

  def create
    @involvement = @case_file.involvements.build(involvement_params)
    if @involvement.save
      flash[:notice] = 'Added to Case'
      redirect_to case_path(@case_file, tab:"related")
    else
      render :new
    end
  end

  def destroy
    @involvement = @case_file.involvements.find(params[:id])
    @involvement.destroy

    redirect_to case_path(@case_file)
  end

  private

  def prepare_case_file
    @case_file = CaseFile.find(params[:case_id])
  end

  def involvement_params
    params.require(:involvement).permit(:role, :case_id, :involvable_id, :involvable_type)
  end

end
