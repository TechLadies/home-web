class ActionsController < ApplicationController

  before_action :prepare_case

  def new
    @action = @case.actions.build
  end

  def create
    @action = @case.actions.build(action_params) 
    @action.user = current_user

    if @action.save
      redirect_to @case
    else
      render :new
    end
  
  end

  private

  def prepare_case
    @case = Case.find(params[:case_id])
  end

  def action_params
    params.require(:act).permit(:description)
  end

end
