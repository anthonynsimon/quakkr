class User < ActiveRecord::Base
  acts_as_voter

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Attachment related validations
  validates :user_name, presence: true, uniqueness: true, length: { minimum: 4, maximum: 20 }, 
      :format => { with: /\A[a-zA-Z0-9_]*\z/, :message => 'may not contain special characters, only letters, numbers and underscores' }
  validates :bio, length: { maximum: 255 }

  has_attached_file :avatar, styles: { thumb: "120x120#", medium: "300x300#" }, default_url: "/images/missing_avatar.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  # Follower relationships
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower
  
  # Following relationships
  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following
    
  def follows?(user)
    self.following.include? user
  end
end
