class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cards, dependent: :destroy
  has_many :buyer_items, class_name: 'Item', foreign_key: 'buyer_id'
  has_many :seller_items, class_name: 'Item', foreign_key: 'seller_id'
  validates :nickname, presence:true
  validates :password, presence: true,
                       length: { minimum: 7 }
  has_one :personal, dependent: :destroy
  has_one :address, dependent: :destroy

  email = /\A\d{3}[-]\d{4}\z/
  validates :email, presence: true, format: { with: email }
  has_many :items
  has_many :favorites
  has_many :fav_items, through: :favorites, source: :item

  def like(item)
    favorites.find_or_create_by(item_id: item.id)
  end

  def unlike(item)
    favorite = favorites.find_by(item_id: item.id)
    favorite.destroy if favorite
  end
end
