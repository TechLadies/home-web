class Admin::CasesController < ApplicationController

<<<<<<< HEAD
  before_action :require_admin_authorization
  # reassign cases
=======
before_action :require_admin_authorization
>>>>>>> 010df0c28ceed06ce7bba8a4e15d53403bf5e4fd

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
