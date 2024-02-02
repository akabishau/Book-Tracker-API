class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # allows token generation, validation and rotation
  # add Devise modules to the User model
  include DeviseTokenAuth::Concerns::User

  has_many :user_books
  has_many :books, through: :user_books
end
