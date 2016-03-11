class ActionsController < ApplicationController

  def new
    @action = Action.new
  end

  def create
    @action = Action.new(action_params)
    if @action.save
      redirect_to @action
#?how to redirect to the case associated with the new action?#
    else
      render 'new'
    end
  end

private

  def action_params
    params.require(:action).permit(:case_id, :user_id, :description, :status)
  end

end
