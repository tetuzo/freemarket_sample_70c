class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cards
  has_many :buyer_items, class_name: 'Item', foreign_key: 'buyer_id'
  has_many :seller_items, class_name: 'Item', foreign_key: 'seller_id'
  validates :nickname, :email, :password, :family_name, :first_name, :first_name_kana, :family_name_kana, :birthday_year, :birthday_month, :birthday_day, presence:true

  devise :validatable, password_length: 7..128
end
