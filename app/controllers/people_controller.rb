class PeopleController < ApplicationController

  before_action :prepare_query, only: [:index]
  before_action :prepare_person, only: [:show, :edit, :update]

  def index
    @people ||= Person.all.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.json { render json: @people }
     end
  end

  def show
    @involvements = @person.involvements
    @case_files = @person.case_files
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to @person
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @person.update_attributes(person_params)
      redirect_to @person
    else
      render :edit
   end
  end

  private

  def prepare_query
    if params[:search]
      @query = PeopleSearchQuery.new(query_params)
      @people = @query.perform.order(created_at: :desc)
    else
      @query = PeopleSearchQuery.new
    end
  end

  def query_params
    params.require(:search).permit(:query)
  end

  def person_params
    params.require(:person).permit(:name, :date_of_birth, :phone, :email, :address, :gender)
  end

  def prepare_person
    @person = Person.find(params[:id])
  end

end
