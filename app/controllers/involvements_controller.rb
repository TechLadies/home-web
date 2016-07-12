class InvolvementsController < ApplicationController

  before_action :prepare_case_file
  before_action :prepare_involvable_class, only: :index

  def index
    @results = @involvable_class.where('LOWER(name) LIKE ?', "%#{params[:q].downcase}%")
    @results = @results.where(industry: params[:i]) if params[:i]
  end

  def new
    @form = InvolvementForm.new(@case_file, involvement_attributes: involvement_params)
  end

  def create
    @form = InvolvementForm.new(@case_file, form_params)
    if @form.save
      flash.now[:notice] = 'Added to case'
    else
      flash.now[:error] = @form.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @involvement = @case_file.involvements.find(params[:id])
    @involvement.destroy

    redirect_to case_path(@case_file)
  end

  private

  def prepare_case_file
    @case_file = CaseFile.find(params[:case_id])
  end

  def involvable_params
    if params.dig(:form, :involvement_attributes, :involvable_type) == 'Person'
      [:name, :gender, :date_of_birth, :phone, :email, :address]
    elsif params.dig(:form, :involvement_attributes, :involvable_type) == 'Organization'
      [:name, :industry, :phone, :email, :address]
    else
      []
    end
  end

  def form_params
    params.require(:form).permit(involvement_attributes: [:role, :role_label, :case_id, :involvable_id, :involvable_type], involvable_attributes: involvable_params)
  end

  def involvement_params
    params.require(:involvement).permit(:role, :role_label, :case_id, :involvable_id, :involvable_type)
  end

  def prepare_involvable_class
    params[:q] ||= ''
    @involvable_class = params[:t].constantize
  end

end
