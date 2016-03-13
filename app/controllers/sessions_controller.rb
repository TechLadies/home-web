class SessionsController < ApplicationController
  skip_before_action :require_login

  before_action :redirect_if_logged_in, except: :destroy

  def new
    @form = LoginForm.new

  end

  def create
    @form = LoginForm.new(login_form_params) { |email, password| login(email, password) }
    if @form.save
      redirect_to organizations_path, notice: 'Login Successful'
    else
      flash.now[:alert] = @form.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    logout
    redirect_to(organizations_path, notice: 'Logged out!')
  end

  private

  def login_form_params
    params.require(:login_form).permit(:email, :password)
  end

  def redirect_if_logged_in
    redirect_to organizations_path if current_user
  end

end
