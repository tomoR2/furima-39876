# テーブル設計
# README

## users テーブル

| Column                  | Type   | Options     |
| ------------------      | ------ | ----------- |
| nick_name               | string | null: false |
| email                   | string | null: false |
| password                | string | null: false |
| family_name             | string | null: false |
| first_name              | string | null: false |
| family_name_kana        | string | null: false |
| first_name_kana         | string | null: false |
| birth_day               | string | null: false |

### Association
- has_many :items
- has_many :transactions


## items テーブル

| Column               | Type       | Options                              |
| ------               | ------     | -------------------------------      |
| image                |            | null: false                          | 
| item_name            | string     | null: false                          |
| concept              | text       | null: false                          |
| category             | string     | null: false                          |
| condition            | string     | null: false                          |
| delivery_charge      | string     | null: false                          |
| shipping_area        | string     | null: false                          |
| delivery_days        | string     | null: false                          |
| price                | string     | null: false                          |
| user_id              | references | null: null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :transaction


## transactions テーブル

| Column               | Type       | Options                              |
| ------               | ------     | -------------------------------      |
| user_id              | references | null: null: false, foreign_key: true |
| item_id              | references | null: null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :item
- has_one :address


## address テーブル

| Column               | Type       | Options                              |
| ------               | ------     | -------------------------------      |
| post_code            | string     | null: false                          |
| prefecture           | string     | null: false                          |
| municipality         | string     | null: false                          |
| street_address       | string     | null: false                          |
| building_name        | string     | null: false                          |
| phone_number         | string     | null: false                          |
| transaction_id       | references | null: null: false, foreign_key: true |

### Association
- belongs_to :transaction
