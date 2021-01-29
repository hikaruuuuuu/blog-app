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

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| title    | string     | null: false                    |
| text     | text       | null: false                    |
| setting  | integer    | null: false                    |
| price    | integer    |                                |
| user     | references | null: false, foreign_key: true |

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

## buys table

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
| postalcode      | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |active_hash
| city            | string     | null: false                    |
| building_number | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| buy             | references | null: false, foreign_key: true | 