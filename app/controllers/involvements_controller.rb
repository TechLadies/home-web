class InvolvementsController < ApplicationController

  before_action :prepare_case_file
  before_action :prepare_involvable_class, only: :index

  def index
    @results = @involvable_class.where('LOWER(name) LIKE ?', "%#{params[:q].downcase}%")
  end

  def new
    @involvement = @case_file_file.involvements.build(involvement_params)
  end

  def create
    @involvement = @case_file_file.involvements.build(involvement_params)
    if @involvement.save
      flash.now[:notice] = 'Added to case'
    else
      render :new
    end
  end

  def destroy
    @involvement = @case_file_file.involvements.find(params[:id])
    @involvement.destroy

    redirect_to case_path(@case_file_file)
  end

  private

  def prepare_case_file
    @case_file_file = CaseFile.find(params[:case_id])
  end

  def involvement_params
    params.require(:involvement).permit(:role, :case_id, :involvable_id, :involvable_type)
  end

  def prepare_involvable_class
    params[:q] ||= ''
    @involvable_class = params[:t].constantize
  end

end
