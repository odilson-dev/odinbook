class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  
  # This line is about making comments commentable themselves
  has_many :comments, as: :commentable, dependent: :destroy
end
