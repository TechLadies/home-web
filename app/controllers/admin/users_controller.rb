class Admin::UsersController < ApplicationController

  before_action :prepare_user, only: [:show, :edit, :update, :activate, :deactivate]
  before_action :require_admin_authorization

  def index
    @users = User.order('id DESC').all
  end

  def show
    @cases = CaseFile.where(user: @user.id).all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to [:admin, @user]
      flash[:notice] = 'New User Created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = 'User Updated'
      redirect_to [:admin, @user]
    else
      render :edit
    end
  end

  def activate
    @user.activate!
    redirect_to admin_user_path(@user)
  end

  def deactivate
    @user.deactivate!
    redirect_to admin_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :contact_number, roles: [])
  end

  def prepare_user
    @user = User.find(params[:id])
  end

end
