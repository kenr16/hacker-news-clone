class Comment < ActiveRecord::Base
  # has_many :replies, class_name: "Comment", foreign_key: "reply_id"
  belongs_to :post
  # belongs_to :reply, class_name: "Comment"
  validates :author, :presence => true
  validates :text, :presence => true
end
