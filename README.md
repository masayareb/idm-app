# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------  | ------------------------ |
| name               | string  | null: false              | #名前
| password           | string  | null: false              | #パスワード
| email              | string  | null: false,unique: true | #メールアドレス
| employee_number    | string  | null: false,unique: true | #社員番号
| affiliation        | string  | null: false              | #所属
| admin              | boolean | null: false              | #管理者ユーザ判定

### Association

- has_many :items
- has_many :user-histories

## items テーブル

| Column             | Type       | Options                        |
| ----------------   | ---------- | ------------------------------ |
| status.id          | integer    | null: false                    | #状態
| item               | string     | null: false                    | #商品名
| category_id        | integer    | null: false                    | #カテゴリー
| manufacturer       | string     | null: false                    | #メーカー
| serial_number      | integer    | null: false,unique: true       | #S/N
| ip                 | string     | null: false                    | #IPアドレス
| purchase_date      | date       | null: false                    | #購入年月
| years_of_use       | integer    | null: false                    | #利用予定年数
| remarks            | text       | null: false                    | #備考
| user               | references | null: false, foreign_key: true | #ユーザid

### Association

- belongs_to :user
- has_many :item-histories

- belongs_to :status
- belongs_to :category

## user_histories テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| change_type          | string     | null: false                    | #変更方法
| change_data          | jsonb      | null: false                    | #変更内容
| user                 | references | null: false, foreign_key: true | #ユーザid

### Association
- belongs_to :user


## item-histories テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| change_type          | string     | null: false                    | #変更方法
| change_data          | jsonb      | null: false                    | #変更内容
| item                 | references | null: false, foreign_key: true | #アイテムid


### Association
- belongs_to :item