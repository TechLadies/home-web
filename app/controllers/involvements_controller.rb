class InvolvementsController < ApplicationController

  before_action :prepare_case_file

  def new
    @involvement = @case_file.involvements.build
  end

  def create
    @involvement = @case_file.involvements.build(involvement_params)
    if @involvement.save
      flash[:notice] = 'Person added to case'
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
    params.require(:involvement).permit(:person_id)
  end

end
