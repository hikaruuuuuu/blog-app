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

