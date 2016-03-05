class PeopleController < ApplicationController

	def index
    @person = Person.all.order(created_at: :desc)
	end

  def show
    @person = Person.find(params[:id])
  end

	def new
		@person = Person.new
	end

  def create
    @person = Person.new(person_params)
   
    if @person.save
      redirect_to @person
    else
      render 'new'
    end
  end	
	  
	def edit
    @person = Person.find(params[:id])
	end
	  
  def update
    @person = Person.find(params[:id])
   
    if @person.update(person_params)
      redirect_to @person
    else
      render 'edit'
   end

  private

  def people_params
    params.require(:person).permit(:name)
  end

end
