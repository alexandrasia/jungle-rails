class User < ActiveRecord::Base
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, length: { minimum: 6 }, presence: true
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.downcase.strip)
    if user && user.authenticate(password)
      user
    end
  end
end
