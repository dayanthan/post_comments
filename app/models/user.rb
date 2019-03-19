class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  # has_many :comments
  validates :email, uniqueness: { allow_blank: true }
end
