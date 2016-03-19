class LoginForm < BaseForm

  attr_accessor :email, :password

  validates :email, :password, presence: true

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

end
