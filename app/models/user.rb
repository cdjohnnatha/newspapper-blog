# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :recoverable,
  :trackable, :validatable, :registerable,
  :omniauthable
  include DeviseTokenAuth::Concerns::User
  #   has_secure_password
  has_many :articles
  has_many :comments

  validates :name, presence: true
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: { on: :create }, length: { minimum: 8, allow_blank: true }
  # validates :password_confirmation, presence: true, on: :create, length: { minimum: 8, allow_blank: true }
end
