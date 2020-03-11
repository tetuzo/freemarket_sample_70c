# README
# freemarket_sample_70c DB設計
## usersテーブル
|Column|Type|Option|
|------|----|------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|family_name|string|null: false|
|post_code|integer|null: false|
|birthday|integer|null: false|
|prefecture|string|null: false|
|municipality|string|null: false|
|adress|integer|null: false|
|buliding_name|string|null: false|
|telephone_number|integer|null: false|

### Association
- has_many :credit_cards dependent: :destroy
- has_many :buyer_items, class_name: 'Item', :foreign_key => 'buyer_id'
- has_many :seller_items, class_name: 'Item', :foreign_key => 'seller_id'

## credit_cardsテーブル
|Column|Type|Option|
|------|----|------|
|card_number|integer|null: false|
|user_name|string|null: false|
|month|integer|null: false|
|year|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|discription|text|null: false|
|status|string|null: false|
|price|integer|null: false|
|shipping_charges|string|null: false|
|shipping_area|string|null: false|
|shipping_days|string|null: false|
|category_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|seller_id|references|null: false,foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|

### Association
- belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'
- belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
- has_many :images dependent: :destroy
- belongs_to :category
- belongs_to :brand
- belongs_to :size

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

### sizeテーブル
|Column|Type|Option|
|------|----|------|
|value|string|null :false|

### Association
- has_many :items