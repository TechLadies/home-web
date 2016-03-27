class Admin::TagsController < ApplicationController
  def index
  	@tags = Tag.all
  end
end

#     resources :tags, only: [:index, :new, :create, :edit, :update]