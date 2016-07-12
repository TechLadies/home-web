class OrganizationsController < ApplicationController

  before_action :prepare_query, only: [:index]
  before_action :prepare_organization, only: [:show, :edit, :update]

  def index
    @organizations ||= Organization.order('id DESC').all
  end

  def show
    @involvements = @organization.involvements
    @case_files = @organization.case_files.order('id DESC')
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to @organization
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @organization.update_attributes(organization_params)
      redirect_to @organization
    else
      render :edit
    end
  end

  private

  def prepare_query
    if params[:search]
      @query = OrganizationSearchQuery.new(query_params)
      @organizations = @query.perform.order(created_at: :desc)
    else
      @query = OrganizationSearchQuery.new
    end
  end

  def query_params
    params.require(:search).permit(:query)
  end

  def organization_params
    params.require(:organization).permit(:name, :phone, :address, :industry, :email)
  end

  def prepare_organization
    @organization = Organization.find(params[:id])
  end

end
