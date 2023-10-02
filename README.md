# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| nickname           | string | null: false |
| birth_day          | string | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column               | Type       | Options                              |
| ------               | ------     | -------------------------------      |
| image                |            | null: false                          | 
| user_id              | references | null: null: false, foreign_key: true |
| title                | string     | null: false                          |
| concept              | text       | null: false                          |
| category             | string     | null: false                          |
| condition            | string     | null: false                          |
| delivery_charge      | string     | null: false                          |
| delivery_days        | string     | null: false                          |
| prefectre            | string     | null: false                          |
| price        | string     | null: false                          |

### Association

- belongs_to :users
- has_one :buyer


## buyers テーブル

| Column               | Type       | Options                              |
| ------               | ------     | -------------------------------      |
| family_name          | string     | null: false                          |
| first_name           | string     | null: false                          |
| family_name_kana     | string     | null: false                          |
| last_name_kana       | string     | null: false                          |
| post_code            | string     | null: false                          |
| prefectre            | string     | null: false                          |
| municipality         | string     | null: false                          |
| street_adress        | string     | null: false                          |
| building_name        | string     | null: false                          |
| phone_number         | string     | null: false                          |
| item_id              | references | null: null: false, foreign_key: true |
| user_id              | references | null: null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :item


