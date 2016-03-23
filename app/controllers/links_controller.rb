class LinksController < ApplicationController
  
  def create
    @case = Case.find(params[:case_id])
    @link = @case.links.create(link_params)
    
    respond_to do |format| 
      format.js {}
      format.html { redirect_to root_path }
    end    
  end

  private
    def link_params
      params.require(:link).permit(:url)
    end
end