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
  belongs_to_active_hash :prefecture
  
  
 

  validates :name, presence: true, length: { maximum:40 }
  validates :discription, presence: true, length: { maximum: 1000 }
  validates :price, presence: true,  numericality: {greater_than_or_equal_to: 300,less_than: 10000000}
  validates :shipping_charges_id, :images, :status_id, :shipping_days_id, :category_id, :prefecture_id, presence: true
  

  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  
  # belongs_to user, foreign_key: 'user_id'
  belongs_to :category, optional: true
end
