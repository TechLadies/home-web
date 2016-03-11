class CasesController < ApplicationController
  
  def close
  	:status
  end
#review close#

  def index
    @cases = Case.all
  end

  def new
  	@case = Case.all
  end

  def create
  end
#do create#

  def show
  	@case = Case.find(params[:id])
  end

  def edit
  	@case = Case.find(params[:id])
  end
#check edit#

  def update
  end

end
