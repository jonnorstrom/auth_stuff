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
    errors.add(:password, "must contain certain stuff") unless (has_lowercase && has_uppercase && has_digit)
  end

  private

  def has_lowercase
    # fancy ruby stuff to analyze password
    # true/false
    true
  end

  def has_uppercase
    ## same thing
    # true/false
    true
  end

  def has_digit
    ## same thing
    # true/false
    true
  end
end
