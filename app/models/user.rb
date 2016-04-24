class User < ActiveRecord::Base
  validates :user_name, presence: true, length: { minimum: 4, maximum: 20 }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
