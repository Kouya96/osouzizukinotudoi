class Item < ApplicationRecord

  belongs_to :user
  belongs_to :genre

  has_many :comments, dependent: :destroy
  #has_many :favorites, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  validates :star,presence:true

  def self.search_for(content, method)
    if method == 'perfect'
      Item.where(title: content)
    elsif method == 'forward'
      Item.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Item.where('title LIKE ?', '%'+content)
    else
      Item.where('title LIKE ?', '%'+content+'%')
    end
  end

  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?

  end
end
