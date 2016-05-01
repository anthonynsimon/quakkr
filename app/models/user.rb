class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true, length: { minimum: 4, maximum: 20 }, 
      :format => { with: /\A[a-zA-Z0-9_]*\z/, :message => 'may not contain special characters, only letters, numbers and underscores' }
  validates :bio, length: { maximum: 255 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
