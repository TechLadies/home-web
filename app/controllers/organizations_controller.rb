class OrganizationsController < ApplicationController

  before_action :prepare_organization, only: [:show, :edit, :update]

  def index
    @organizations = Organization.order('id DESC').all
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

  def organization_params
    params.require(:organization).permit(:name, :phone, :address, :industry, :email)
  end

  def prepare_organization
    @organization = Organization.find(params[:id])
  end

end
