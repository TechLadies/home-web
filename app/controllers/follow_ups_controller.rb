class FollowUpsController < ApplicationController

  before_action :prepare_casefile

  def new
    @followup = @case.follow_ups.build
  end

  def create
    @followup = @case.follow_ups.build(followup_params) 
    @followup.user = current_user

    if @followup.save
      redirect_to @case
    else
      render :new
    end
  
  end

  private

  def prepare_casefile
    @case = CaseFile.find(params[:case_id])
  end

  def followup_params
    params.require(:entry).permit(:description)
  end

end
