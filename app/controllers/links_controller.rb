class LinksController < ApplicationController

  before_action :prepare_case

  def create
    @link = @case_file.links.create(link_params)
    redirect_to case_path(@case_file, anchor: 'documents')
  end

  def destroy
    @link = @case_file.links.find(params[:id])
    @link.destroy
    redirect_to case_path(@case_file, anchor: 'documents')
  end

  private

  def prepare_case
    @case_file = CaseFile.find(params[:case_id])
  end

  def link_params
    params.require(:link).permit(:url, :filename, :mimetype, :size)
  end

end
