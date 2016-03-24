class Admin::UsersController < ApplicationController

  before_action :prepare_user, only: [:show, :edit, :update]
  before_action :check_admin, only: [:new, :create]
  before_action :check_user_or_admin, only: [:edit, :update]

  def index
    @users = User.order('id DESC').all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to [:admin, @user]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to [:admin, @user]
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :contact_number, roles: [])
  end

  def prepare_user
    @user = User.find(params[:id])
  end

  def check_admin
    if current_user.roles.exclude? 'Admin'
      flash[:notice] = 'Sorry, you have to be the Admin to access this function'
      redirect_to admin_users_path
    end
  end

  def check_user_or_admin
    unless (current_user.roles.include? 'Admin') || (current_user.name == @user.name)
      flash[:notice] = 'Sorry, you have to be the Admin/User to access this function'
      redirect_to admin_users_path
    end
  end

end
