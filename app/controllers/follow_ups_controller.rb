class FollowUpsController < ApplicationController

  before_action :prepare_casefile

  def new
    @followup = @case_file.follow_ups.build
  end

  def create
    @followup = @case_file.follow_ups.build(followup_params) 
    @followup.user = current_user

    if @followup.save
      flash[:notice] = "Added to Case"
    else
      render :new
    end
  
  end

  private

  def prepare_casefile
    @case_file = CaseFile.find(params[:case_id])
  end

  def followup_params
    params.require(:entry).permit(:description)
  end

end
