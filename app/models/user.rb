class User < ApplicationRecord
  has_many :authentication
  has_many :friend_requests
  has_many :postsrails 
  has_many :comments
  has_many :likes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
         
end
