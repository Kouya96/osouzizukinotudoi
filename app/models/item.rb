class Item < ApplicationRecord

  belongs_to :user
  belongs_to :genre, dependent: :destroy

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  validates :star,presence:true

  def self.search(keyword)
      joins(:genre).where(["title like? OR body like? or genres.name LIKE ?", "%#{keyword}%", "%#{keyword}%","%#{keyword}%"])
  end

  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?

  end
end
