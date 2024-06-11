class Message < ApplicationRecord
  belongs_to :private_chat
  belongs_to :profile

  
    

  def joined_users
    self.private_chat.profiles.map(&:user).uniq
  end
  
end
