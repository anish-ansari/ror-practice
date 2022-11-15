class User < ApplicationRecord
  # bcrypt method
  has_secure_password

  # associating with article model
  has_many :articles

  # associating with comment model
  has_many :comments

  # a callback to convert email to lowecase before it is saved to the database
  before_save :downcase_email

  # name validator
  validates :name, presence: true
  # regex for valid email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # email validator
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  # password validator
  validates :password, presence: true, length: { minimum: 6 }

  private

  def downcase_email
    self.email = email.downcase
  end
end
