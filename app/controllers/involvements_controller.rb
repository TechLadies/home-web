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
    @client = @case_file.involvements.where(role:0).find(params[:id])
    @client.destroy

    @employer = @case_file.involvements.where(role:1).find(params[:id])
    @employer.destroy
  end

  private

  def prepare_case_file
    @case_file = CaseFile.find(params[:case_id])
  end

  def involvement_params
    params.require(:involvement).permit(:person_id)
  end

end
