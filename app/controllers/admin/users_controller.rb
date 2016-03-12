class Admin::UsersController< ActionController::Base

  before_action :prepare_user, only: [:show, :edit, :update]

  def index
    @users = User.all
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
    params.require(:user).permit(:name, :email, :contact_number, roles: [])
  end

  def prepare_user
    @user = User.find(params[:id])
  end

end
