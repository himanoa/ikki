# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: %r{\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z}i }
  validates :password_digest, presence: true, uniqueness: true
  has_many :entries
end
