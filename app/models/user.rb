class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, :password, :family_name, :first_name, :first_name_kana, :family_name_kana, :birthday_year, :birthday_month, :birthday_day, presence:true

  devise :validatable, password_length: 7..128
end
