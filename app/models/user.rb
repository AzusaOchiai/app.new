class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :post_comments, dependent: :destroy
has_many :posts, dependent: :destroy
has_many :favorites, dependent: :destroy
attachment :profile_image


 validates :username,uniqueness: true
 validates :username, presence: true
 validates :username, length: { minimum: 2 }

 # deviseでemailを不必要にする
 def email_required?
   false
 end
 def email_changed?
   false
 end
end
