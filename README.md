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

|Column    |Type    |Options                       |
|------    |----    |-------                       |
|nickname  |string  |null: false, foreign_key: true|
|email     |string  |null: false, unique: true     |
|password  |string  |null: false                   |
|first name|string  |null: false                   |
|last name |string  |null: false                   |
|first kana|string  |null: false                   |
|last kana |string  |null: false                   |
|birthday  |datetime|null: false                   |

<!-- goodsテーブル -->

|Column     |Type    |Options    |
|------     |----    |-------    |
|name       |string  |null: false|
|category   |string  |null: false|
|condition  |text    |null: false|
|description|text    |null: false|
|image      |string  |null: false|
|price      |integer |null: false|
|prefecture |string  |null: false|
|days until |datetime|null: false|
|burden     |boolean |null: false|

<!-- boughtテーブル -->

|Column|Type|Options|
|------|----|-------|

<!-- shippingテーブル -->

|Column        |Type   |Options    |
|------        |----   |-------    |
|postal        |integer|null: false|
|prefecture    |string |null: false|
|city          |string |null: false|
|street address|integer|null: false|
|building name |string |           |
|phone number  |integer|null: false|