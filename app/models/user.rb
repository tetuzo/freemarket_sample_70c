class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cards, dependent: :destroy
  has_many :buyer_items, class_name: 'Item', foreign_key: 'buyer_id'
  has_many :seller_items, class_name: 'Item', foreign_key: 'seller_id'
  validates :nickname, :email, presence:true
  validates :password, presence: true,
                       length: { minimum: 7 }
  has_one :personal, dependent: :destroy
  has_one :address, dependent: :destroy
end
