class Item < ApplicationRecord

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :brand, optional: true
  belongs_to :trde, optional: true
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id', optional: true
  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id', optional: true


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :shipping_days
  belongs_to_active_hash :status

  validates :name, presence: true
  validates :discription, presence: true


  
  validates :status_id, presence: true
  validates :price, presence: true
  validates :shipping_charges_id, presence: true
  validates :shipping_days_id, presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  
  # belongs_to user, foreign_key: 'user_id'
  belongs_to :category, optional: true
end
