class LoginForm < BaseForm

  attr_accessor :email, :password

  validates :email, :password, presence: true
  validate :user_account_is_active

  def initialize(controller, params={})
    super(params)
    @controller = controller
  end

  def save
    if valid?
      errors.add(:base, 'Please check your email and password again') unless login_successfully?
    end
    errors.empty?
  end

  private

  def login_successfully?
    @controller.login(email, password)
  end

  def user_account_is_active
    @user = User.find_by_email(email)
    errors.add(:base, 'Your account has been deactivated') if @user && @user.inactive?
  end

end
