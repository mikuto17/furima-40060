# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

<!-- usersテーブル -->

|Column             |Type    |Options                       |
|------             |----    |-------                       |
|nickname           |string  |null: false                   |
|email              |string  |null: false, unique: true     |
|encrypted_password |string  |null: false                   |
|first_name         |string  |null: false                   |
|last_name          |string  |null: false                   |
|first_kana         |string  |null: false                   |
|last_kana          |string  |null: false                   |
|birthday           |date    |null: false                   |

has_many :products
has_many :boughts

<!-- productsテーブル -->

|Column       |Type      |Options          |
|------       |----      |-------          |
|name         |string    |null: false      |
|category_id  |integer   |null: false      |
|condition_id |integer   |null: false      |
|description  |text      |null: false      |
|price        |integer   |null: false      |
|prefecture_id|integer   |null: false      |
|days_until_id|integer   |null: false      |
|burden_id    |integer   |null: false      |
|user         |references|foreign_key: true|

belongs_to :user
has_one :bought

<!-- boughtsテーブル -->

|Column  |Type      |Options|
|------  |----      |-------|
|user    |references|null: false, foreign_key: true|
|product    |references|null: false, foreign_key: true|

belongs_to :user
belongs_to :product
has_one :shipping

<!-- shippingsテーブル -->

|Column         |Type      |Options    |
|------         |----      |-------    |
|postal         |string    |null: false|
|prefecture_id  |integer   |null: false|
|city           |string    |null: false|
|street_address |string    |null: false|
|building_name  |string    |           |
|phone_number   |string    |null: false|
|bought        |references|foreign_key: true|

belongs_to :bought