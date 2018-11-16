# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_secure_password
  has_many :articles
  has_many :comments

  validates :name, :password_digest, presence: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: { on: :create }, length: { minimum: 8, allow_blank: true }
end
