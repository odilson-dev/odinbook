class Profile < ApplicationRecord
    belongs_to :user
    has_many :messages
    has_many :private_chats_as_profile1, class_name: "PrivateChat", foreign_key: "profile1_id"
    has_many :private_chats_as_profile2, class_name: "PrivateChat", foreign_key: "profile2_id"
end
