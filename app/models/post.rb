class Post < ActiveRecord::Base
  validates :user_id, presence: true
  validates :message, presence: true, length: { minimum: 2, maximum: 300 }
  belongs_to :user
  has_many :comments, dependent: :destroy
end
