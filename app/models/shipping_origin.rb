class ShippingOrigin < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :prefecture, :municipality, presence: true

  name =/\A[ぁ-んァ-ン一-龥]/
  validates :destination_family_name, :destination_first_name, presence: true, format: { with: name }

  kana = /\A[ぁ-んー－]+\z/
  validates :destination_family_name_kana, :destination_first_name_kana, presence: true, format: { with: kana }

  postcode = /\A\d{3}[-]\d{4}\z/
  validates :post_code, presence: true, format: { with: postcode }

end
