class LinksController < ApplicationController
  
  def create
    @case = CaseFile.find(params[:case_id])
    @link = @case.links.create(link_params)
    
    respond_to do |format| 
      format.js {}
      format.html { redirect_to root_path }
    end    
  end

  def destroy
    @case = CaseFile.find(params[:case_id])
    @link = @case.links.find(params[:id])
    @link.destroy

    redirect_to case_path(@case)
  end

  private
    def link_params
      params.require(:link).permit(:url, :filename)
    end
end