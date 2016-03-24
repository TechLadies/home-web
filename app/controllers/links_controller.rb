class LinksController < ApplicationController
  
  def create
    @case = Case.find(params[:case_id])
    @link = @case.links.create(link_params)
    
    respond_to do |format| 
      format.js {}
      format.html { redirect_to root_path }
    end    
  end

  def destroy
    @case = Case.find(params[:case_id])
    @link = @case.links.find(params[:id])
    @link.destroy

    redirect_to case_path(@case)
  end

  private
    def link_params
      params.require(:link).permit(:url)
    end
end