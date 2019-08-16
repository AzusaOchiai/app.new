class Post < ApplicationRecord
	belongs_to :user
	attachment :profile_image

	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

    validates :title, presence: true
    validates :body, presence: true
	validates :body, length: { maximum: 200 }

def favorited_by?(user)
   favorites.where(user_id: user.id).exists?
end

end
