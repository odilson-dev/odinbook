class PrivateChat < ApplicationRecord
  belongs_to :profile1, class_name: "Profile"
  belongs_to :profile2, class_name: "Profile"
  has_many :messages, dependent: :destroy
end
