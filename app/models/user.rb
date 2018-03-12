class User < ApplicationRecord
  validate :check_password_length
  validate :req_chars_for_password
  validates :username, uniqueness: true
  validates :username, length: { minimum: 6 }
  has_secure_password

  def check_password_length
    if password && password.length < 6
      errors.add(:password, "can't be less than 6 characters")
    end
  end

  def req_chars_for_password
    errors.add(:password, "must contain at least one instance of lower/upper letters and a number") unless (has_lowercase && has_uppercase && has_digit)
  end

  private

  def has_lowercase
    password.match(/[a-z]/)
  end

  def has_uppercase
    /[A-Z]/.match(password)
  end

  def has_digit
    /\d/.match(password)
  end
end
