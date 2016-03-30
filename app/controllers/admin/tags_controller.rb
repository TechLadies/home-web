class Admin::TagsController < ApplicationController
  def index
  	@tags = Tag.all
  end

  def add
  	@tags = Tag.all
  	@tag = Tag.new(:parent_id => params[:parent_id])
  end

  def new
  	@tag = Tag.new
  	@tag.id = params[:parent_id]
  end

  def create
  	@tag = Tag.new(tag_params)
      if @tag.save
      redirect_to admin_tags_path
      flash[:notice] = 'New Tag Created'
    else
      render :new
      flash[:alert] = 'Please Retry'
    end
  end

private

  def tag_params
    params.require(:tag).permit(:name, :description, :parent_id)
  end

end

#     resources :tags, only: [:index, :new, :create, :edit, :update]