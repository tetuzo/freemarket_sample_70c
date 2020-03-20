class Item < ApplicationRecord

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :brand, optional: true
  belongs_to :trde, optional: true




  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :shipping_days
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  
  
  


  validates :name, presence: true, length: { maximum:40 }
  validates :discription, presence: true, length: { maximum: 1000 }
  validates :status_id, presence: true
  validates :price, presence: true,  numericality: {greater_than_or_equal_to: 300,less_than: 10000000}
  validates :shipping_charges_id, presence: true
  validates :shipping_days_id, presence: true
  # カテゴリー機能実装待ち
  # validates :category_id, presence: true
  validates :prefecture_id, presence: true
  validates :images, presence: true

  
  belongs_to :category, optional: true
end
