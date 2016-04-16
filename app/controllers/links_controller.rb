class LinksController < ApplicationController

  before_action :prepare_case
  
  def create
    @link = @case.links.create(link_params)
    redirect_to case_path(@case)
  end

  def destroy
    @link = @case.links.find(params[:id])
    @link.destroy
    redirect_to case_path(@case)
  end

  private

  def prepare_case
    @case = CaseFile.find(params[:case_id])
  end
 
  def link_params
    params.require(:link).permit(:url, :filename, :mimetype, :size)
  end

end
