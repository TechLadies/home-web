class Admin::CasesController < ApplicationController

  before_action :require_admin_authorization

  def index
    @cases = CaseFile.all
    respond_to do |format|
      format.html
      format.csv { send_data @cases.to_csv }
      format.xls
    end
  end

  def reassign
    @case = CaseFile.find(params[:id])
    @users = User.order('id DESC').all
  end

  def update_assignment
    @case = CaseFile.find(params[:id])
    if @case.update_attributes(case_params)
      redirect_to case_path(@case)
    else
      render :reassign
    end
  end

  private

  def case_params
    params.require(:case_file).permit(:user_id)
  end

end
