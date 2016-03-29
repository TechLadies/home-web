class Admin::TagsController < ApplicationController

  before_action :prepare_tag, only: [:edit, :update, :parent]

  def index
  	@tags = Tag.all
  end

  def new
  	@tag = Tag.new
  end

  def create
  	@tag = Tag.new(tag_params)
  	if @tag.save
  	  redirect_to tags_path
#  	  render [:admin, @tag]
  	  flash[:notice] = 'New Tag Created'
  	else
  	  render :new
      flash[:error] = 'Tag Not Created! Please Retry.'      
  	end
  end

  def edit
  end  

  def update
    if @tag.update_attributes(tag_params)
      flash[:success] = 'Tag Updated!'
      redirect_to tags_path       
    else
      render :edit
      flash[:error] = 'Tag Not Updated! Please Retry.'
    end
  end

private
  def prepare_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name, :parent_tag_id, :description)
  end

end