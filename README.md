# README
# freemarket_sample_70c DB設計
## usersテーブル
|Column|Type|Option|
|------|----|------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_one :personal, dependent: :destroy
- has_many :credit_cards dependent: :destroy
- has_one :address, dependent: :destroy
- has_many :buyer_items, class_name: 'Item', :foreign_key => 'buyer_id'
- has_many :seller_items, class_name: 'Item', :foreign_key => 'seller_id'

## cardsテーブル
|Column|Type|Option|
|------|----|------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|descliption|text|null: false|
|status_id|string|null: false|
|price|integer|null: false|
|shipping_charges_id|string|null: false|
|shipping_days_id|string|null: false|
|category_id|references|null: false, foreign_key: true|
|size_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
|seller_id|references|null: false,foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|prefecture_id||null: false|

### Association
- has_many :images dependent: :destroy
- belongs_to :category
- belongs_to :brand
- belongs_to :size
- belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'
- belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'

## imagesテーブル
|Column|Type|Option|
|------|----|------|
|items_id|references|null: false, foreign_key :true|
|image|string|null: false|

### Association
- belongs_to :item

## categorysテーブル
|Column|Type|Option|
|------|----|------|
|name|string|
|ancestry|string|null: false|


### Association
- has_many :items
- has_many :brands
- has_ancestry

## brandsテーブル
|Column|Type|Option|
|------|----|------|
|name|string|
|category_id|references|null :false, foreign_key :true|

### Association
- has_many :items
- belongs_to :category

## personalsテーブル
|Column|Type|Option|
|------|----|------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
|user_id|references|null: false, foreign_key|

### Association
- belongs_to :user

## addressesテーブル
|Column|Type|Option|
|------|----|------|
|distination_first_name|string|null: false|
|distination_family_name|string|null: false|
|distination_first_name_kana|string|null: false|
|distination_family_name_kana|string|null: false|
|post_code|integer|null: false|
|prefecture|string|null: false|
|municipality|string|null: false|
|house_number|integer|null: false|
|buliding_name|string|null: false|
|telephone_number|integer|null: false|
|user_id|references|null: false, foreign_key|

### Association
- belongs_to :user

fork_test_senda