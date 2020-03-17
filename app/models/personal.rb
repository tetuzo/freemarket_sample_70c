class Personal < ApplicationRecord
  belongs_to :user, optional: true

  birthday = /\d/
  validates :birthday_year, :birthday_month, :birthday_day, presence: true, format: { with: birthday }

  name = /\A[ぁ-んァ-ン一-龥]/
  validates :family_name, :first_name ,presence: true, format: { with: name }

  kana = /\A[ぁ-んー－]+\z/
  validates :family_name_kana, :first_name_kana ,presence: true, format: { with: kana }
end