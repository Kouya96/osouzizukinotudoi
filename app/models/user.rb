class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :profile_image

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  #ゲストログイン
  def self.guest
    find_or_create_by!( email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.last_name = "guestuser"
      user.first_name = "guestuser"
      user.last_name_kana = "guestuser"
      user.first_name_kana = "guestuser"
  end
  end

end
