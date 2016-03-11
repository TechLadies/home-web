class DocumentsController < ApplicationController

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to @document
      flash[:success] = "New Document Uploaded!"
#?how to redirect to the case associated with the new document?#
    else
      render 'new'
    end
  end

private

  def document_params
    params.require(:document).permit(:case_id, :file_url)
  end

end
