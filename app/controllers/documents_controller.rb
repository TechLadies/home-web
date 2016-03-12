class DocumentsController < ApplicationController

  before_action :prepare_case

  def new
    @document = @case.documents.build
  end

  def create
    @document = @case.documents.build(document_params)
    if @document.save
      flash[:success] = "New Document Uploaded!"
      redirect_to @case
    else
      render :new
    end
  end

  private

  def prepare_case
    @case = Case.find(params[:case_id])
  end

  def document_params
    params.require(:document).permit(:file_url)
  end

end
