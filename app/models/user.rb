class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :github]

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
  has_one :profile, dependent: :destroy

  has_many :notifications, as: :recipient, dependent: :destroy, class_name: "Noticed::Notification"
  has_many :notification_mentions, as: :record, dependent: :destroy, class_name: "Noticed::Event"

  after_create :create_profile
  after_create :send_welcome_email

  def create_profile
    profile = Profile.new(user: self, nickname: self.username, profile_picture: "default.png")
    unless profile.save
      puts "Profile could not be saved because: #{profile.errors.full_messages.join(", ")}"
    end
  end

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name
      user.avatar_url = auth.info.image
    end
  end

  

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome_email.deliver_now
  end

  
end
