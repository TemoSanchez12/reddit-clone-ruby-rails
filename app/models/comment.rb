class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :replies, class_name: 'Comment', foreign_key: :parent_comment_id, dependent: :destroy
end
