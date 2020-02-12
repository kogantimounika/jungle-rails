class User < ActiveRecord::Base
  has_secure_password
  def self.authenticate_with_credentials(email, password)
    @user = self.where("lower(email) = ?", email.delete(' ').downcase).first.try(:authenticate, password)
  end
  validates :password, length: { minimum: 5 }
  validates :email, uniqueness: { case_sensitive: false }
end
