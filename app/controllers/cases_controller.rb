class CasesController < ApplicationController

#work in progress#  
  def close
  	:status
  end

  def index
    @cases = Case.all
  end

  def new
  	@case = Case.all
  end

  def create
  end

  def show
  	@case = Case.find(params[:id])
  end

  def edit
  	@case = Case.find(params[:id])
  end

  def update
  end

end
