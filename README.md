https://blog-app-20210402.herokuapp.com/

## DB 設計
## users table

| Column             | Type           | Options     |
|--------------------|----------------|-------------|
| nickname           | string         | null: false |
| email              | string(devise) | null: false |
| encrypted_password | integer(devise)| null: false |


### Association

- has_many :articles
- has_many :buys
- has_many :comments

## articles table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| title       | string     | null: false                    |
| text        | text       | null: false                    |
| buy_setting | boolean    | null: false                    |
| price       | integer    |                                |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :buys

## comments table

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| text    | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| artice  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :article

## user_deals table

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| user    | references | null: false, foreign_key: true | 購入者
| artice  | references | null: false, foreign_key: true | 購入した記事

### Association

- belongs_to :user
- belongs_to :article
- has_one :address

## addresses table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| f_name          | string     | null: false                    |
| l_name          | string     | null: false                    |
| f_name_kana     | string     | null: false                    |
| l_name_kana     | string     | null: false                    |
| postal_code      | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |active_hash
| city            | string     | null: false                    |
| building_number | string     | null: false                    |
| building_name        | string     |                                |
| phone_number    | string     | null: false                    |
| user_deal             | references | null: false, foreign_key: true | 

### Association
- belongs_to :user_deal
