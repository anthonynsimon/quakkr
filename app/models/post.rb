class Post < ActiveRecord::Base
  acts_as_votable

  validates :user_id, presence: true
  validates :message, presence: true, length: { minimum: 2, maximum: 300 }
  
  belongs_to :user
  
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  scope :by_users, -> (user) { where(user: user) }
end
