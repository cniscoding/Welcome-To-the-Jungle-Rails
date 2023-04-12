class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: {minimum: 6}

  before_create :format_email

  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    user = User.find_by_email(email)

    if user.authenticate(password)
      user
    else
      nil
    end
  end

  def format_email
    self.email = email.strip.downcase
  end
end
