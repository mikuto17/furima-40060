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

has_many :goods
has_many :boughts

<!-- goodsテーブル -->

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
|users        |references|foreign_key: true|

belongs_to :users
has_many :boughts

<!-- boughtsテーブル -->

|Column  |Type      |Options|
|------  |----      |-------|
|users   |references|null: false, foreign_key: true|
|goods   |references|null: false, foreign_key: true|

belongs_to :users
belongs_to :goods
has_one :shippings

<!-- shippingsテーブル -->

|Column         |Type      |Options    |
|------         |----      |-------    |
|postal         |string    |null: false|
|prefecture_id  |integer   |null: false|
|city           |string    |null: false|
|street_address |string    |null: false|
|building_name  |string    |           |
|phone_number   |string    |null: false|
|boughts        |references|foreign_key: true|

belongs_to :boughts