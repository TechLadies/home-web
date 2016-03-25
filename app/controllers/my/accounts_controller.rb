class My::AccountsController < ApplicationController

  before_action :prepare_account

  def show
  end

  def update
    if @account.update(account_params)
      redirect_to my_account_path
    else
      render :show
    end
  end

  private

  def prepare_account
    @account = current_user
  end

  def account_params
    params.require(:user).permit(:name, :email, :contact_number, :password, :password_confirmation)
  end

end
