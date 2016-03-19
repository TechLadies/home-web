class SessionsController < ApplicationController

  skip_before_action :require_login

  before_action :redirect_if_logged_in, except: :destroy

  def new
    @form = LoginForm.new(self)
  end

  def create
    @form = LoginForm.new(self, login_form_params)
    if @form.save
      flash[:notice] = "Login successfully"
      redirect_to cases_path
    else
      flash.now[:alert] = @form.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    logout
    redirect_to(cases_path, notice: 'Logged out!')
  end

  private

  def login_form_params
    params.require(:login_form).permit(:email, :password)
  end

  def redirect_if_logged_in
    redirect_to cases_path if current_user
  end

end
