class User < ApplicationRecord
  authenticates_with_sorcery!

  attr_accessor :password, :password_confirmation

  validates_presence_of :email, massage: "The email address is not legitimate!",
    with: /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/,
    if: proc { |user| !user.email.blank? }
  validates :email, uniqueness: true


  validates_presence_of :password, message: "password cannot be empty",
    if: :need_validate_password
  validates_presence_of :password_confirmation, message: "Password confirmation cannot be empty",
    if: :need_validate_password
  validates_confirmation_of :password, message: "password inconsistency",
    if: :need_validate_password
  validates_length_of :password, message: "The minimum password is 6 digits", minimum: 6,
    if: :need_validate_password

  def username
    self.email.blank? ? self.cellphone : self.email.split('@').first
  end
  
  private
  def need_validate_password
    self.new_record? ||
      (!self.password.nil? || !self.password_confirmation.nil?)
  end

end
