class Item < ApplicationRecord

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  # belongs_to :brand
  # belongs_to :trde



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
  


  
  # belongs_to user, foreign_key: 'user_id'
  belongs_to :category
end
