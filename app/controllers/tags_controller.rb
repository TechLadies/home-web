class TagsController < ApplicationController

	before_action :prepare_query, only: [:index]

  def index
    @tags = Tag.where('lower(name) LIKE ?', "%#{@query.downcase}%")
  end

  private

  def prepare_query
  	@query = params[:q] || ''
  end

end
