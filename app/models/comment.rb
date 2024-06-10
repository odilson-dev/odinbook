class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  has_many notification_mentions, as: :record, dependent: :destroy, class_name: "Noticed::Event"
  
  # This line is about making comments commentable themselves
  has_many :comments, as: :commentable, dependent: :destroy
end
