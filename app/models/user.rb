class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, format: { with: /\A\d+\z/ }, presence: true

  before_validation { phone&.remove!('-') }
end
