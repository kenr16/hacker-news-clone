class Comment < ActiveRecord::Base
  belongs_to :post
  validates :author, :presence => true
  validates :text, :presence => true
end
