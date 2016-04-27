class Admin::TagsController < ApplicationController

  before_action :require_admin_authorization
  before_action :all_tags, only: [:index, :new, :edit, :update]
  before_action :prepare_tag, only: [:edit, :update]

  before_action :cannot_be_tagged_under_itself, only: :update

  def index
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = 'New Tag Created'
      redirect_to admin_tags_path
    else
      flash[:alert] = @tag.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @tag.update_attributes(tag_params)
      flash[:success] = 'Tag Updated'
      redirect_to admin_tags_path
    else
      flash[:alert] = @tag.errors.full_messages.to_sentence
      render :edit
    end
  end

  private
  
  def all_tags
    @tags = Tag.order('id ASC').all
  end

  def tag_params
    params.require(:tag).permit(:name, :description, :parent_id)
  end

  def prepare_tag
    @tag = Tag.find(params[:id])
  end

  def cannot_be_tagged_under_itself
    errors.add(:parent_id, 'cannot be equal to own id') if @tag.parent_id == @tag.id
  end

end
