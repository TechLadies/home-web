class OrganizationsController < ApplicationController

  before_action :prepare_organization, only: [:show, :edit, :update]

  def index
    @organizations = Organization.all
  end

  def show
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

  def organization_params
    params.require(:organization).permit(:name, :phone, :address, :industry)
  end

  def prepare_organization
    @organization = Organization.find(params[:id])
  end

end