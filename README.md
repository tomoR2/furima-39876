# テーブル設計
# README

## users テーブル

| Column                  | Type   | Options                  |
| ------------------      | ------ | -----------              |
| nick_name               | string | null: false              |
| email                   | string | null: false, unique:true |
| encrypted_password      | string | null: false              |
| family_name             | string | null: false              |
| first_name              | string | null: false              |
| family_name_kana        | string | null: false              |
| first_name_kana         | string | null: false              |
| birth_day               | date   | null: false              |

### Association
has_many :items
has_many :orders


## items テーブル

| Column               | Type       | Options                              |
| ------               | ------     | -------------------------------      |
| item_name            | string     | null: false                          |
| concept              | text       | null: false                          |
| category_id          | integer    | null: false                          |
| condition_id         | integer    | null: false                          |
| delivery_charge_id   | integer    | null: false                          |
| prefecture_id        | integer    | null: false                          |
| delivery_days_id     | integer    | null: false                          |
| price                | integer    | null: false                          |
| user                 | references | null: null: false, foreign_key: true |

### Association
belongs_to :user
has_one :order
belongs_to_active_hash :category
belongs_to_active_hash :condition
belongs_to_active_hash :delivery_charge
belongs_to_active_hash :prefecture
belongs_to_active_hash :delivery_days

## orders テーブル

| Column               | Type       | Options                              |
| ------               | ------     | -------------------------------      |
| user                 | references | null: null: false, foreign_key: true |
| item                 | references | null: null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :address


## addresses テーブル

| Column               | Type       | Options                              |
| ------               | ------     | -------------------------------      |
| post_code            | string     | null: false                          |
| prefecture_id        | integer    | null: false                          |
| municipality         | string     | null: false                          |
| street_address       | string     | null: false                          |
| building_name        | string     |                                      |
| phone_number         | string     | null: false                          |
| order                 | references | null: null: false, foreign_key: true |

### Association
belongs_to :order
belongs_to_active_hash :prefecture

