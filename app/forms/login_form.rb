class LoginForm < BaseForm

  attr_accessor :email, :password

  validates :email, :password, presence: true

  def initialize(params={}, &block)
    super(params)
    @authentication_method = block
  end

  def save
    if valid?
      errors.add(:base, 'Please check your email and password again') unless login_successfully?
    end
    errors.empty?
  end

  private

  def login_successfully?
    @authentication_method.call email, password
  end

end
