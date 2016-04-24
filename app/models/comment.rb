class Comment < ActiveRecord::Base
  validates :body, presence: true, length: { maximum: 300 }

  belongs_to :user
  belongs_to :post
end
