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
  
  followability

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :image
  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end

  after_create :send_welcome_email

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome_email.deliver_now
  end

  
end
