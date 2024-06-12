class PrivateChat < ApplicationRecord
  belongs_to :profile1, class_name: "Profile"
  belongs_to :profile2, class_name: "Profile"
  has_many :messages, dependent: :destroy

  def profiles
    [profile1, profile2]
  end

  def self.get_private_chat(profile1_id, profile2_id)
    where(
      "(profile1_id = :profile1_id AND profile2_id = :profile2_id) OR
      (profile1_id = :profile2_id AND profile2_id = :profile1_id)",
      profile1_id: profile1_id, profile2_id: profile2_id,
    ).first
  end
end
