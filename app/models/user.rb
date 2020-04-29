class User < ApplicationRecord
  has_secure_password

  belongs_to :language, optional: true
  has_many :places, dependent: :nullify

  validates_presence_of :pseudo
  validates_length_of :pseudo, maximum: 20
  validates_uniqueness_of :pseudo, case_sensitive: false

  # Email is mandatory
  validates_presence_of :email
  validates_length_of :email, maximum: 50

  validates_length_of :password, minimum: 5

  # Functions to remove spaces in the string fields
  def pseudo=(pseudo)
    self[:pseudo] = pseudo.strip if pseudo
  end

  def email=(email)
    self[:email] = email.strip if email
  end
end
