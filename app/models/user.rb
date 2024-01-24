class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence:true, uniqueness: true
  validates :birthdate, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A\S+@\S+\z/, message: "Invalid email format" }
  validates :password, presence: true, length: { in: 6..20 }
end
