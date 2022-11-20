class User < ApplicationRecord
  # bcrypt method
  has_secure_password

  # associating with article model
  has_many :articles

  # associating with comment model
  has_many :comments

  # associating an avatar attachment
  has_one_attached :avatar

  # a callback to convert email to lowecase before it is saved to the database
  before_save :downcase_email

  before_commit :send_email

  # name validator
  validates :name, presence: true
  # regex for valid email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # email validator
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  # password validator
  validates :password, presence: true, length: { minimum: 6 }
  # attachment validator
  validate :acceptable_image

  private

  def downcase_email
    self.email = email.downcase
  end

  def acceptable_image
    # if image is attached only then will we validate
    return unless avatar.attached?

    # if file size is greater than 1 MB then too big
    errors.add(:avatar, 'is too big') unless avatar.byte_size <= 1.megabyte

    # checking if file is jpeg/png or not
    acceptable_types = ['image/jpeg', 'image/png', 'image/gif', 'image/jpg']
    return if acceptable_types.include?(avatar.blob.content_type)

    errors.add(:avatar, 'must be a JPEG/JPG, PNG or GIF')
  end

  def send_email
    # performs job whenever the queuing system is free
    SendNotificationsJob.perform_later(id)
  end
end
