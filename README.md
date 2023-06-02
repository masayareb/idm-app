# アプリケーション名
IDMアプリ(information device management)

# アプリケーション概要
情報機器を管理することが出来る<br>
機器をユーザに紐付けることによって、機器に紐づいているユーザにて機器情報を更新させる<br>
また、管理者ユーザは情報機器、ユーザ情報を管理することが出来る<br>
ユーザに異動等により変更が発生した場合、ユーザにて情報を更新させることを可能とし、管理者の手間を削減させることを目的としている

# URL
https://idm-app.onrender.com

# テスト用アカウント
・Basic認証ID：admin<br>
・Basic認証パスワード：idmadmin<br>
・一般ユーザメールアドレス：test@co.jp<br>
・一般ユーザパスワード：Testuser1<br>
・管理者ユーザメールアドレス：admin-user@xxx.co.jp<br>
・管理者ユーザパスワード：Adminuser1<br>
※社員番号は0001~0005まで作成。一般ユーザ(田中 太郎)は0001にて設定

# 利用方法
## 情報機器登録登録
1.トップページ（ユーザ機器一覧画面）のヘッダーからユーザ新規登録を行う<br>
2.新規機器登録ボタンから社員番号・状態・機器種類・機器名・メーカー・IPアドレス・S/N・購入年月・利用年数を入力し機器の登録を行う<br>
  ※任意で備考入力・ファイル添付が可能<br>
3.登録後、機器登録時に入力した社員番号のユーザのトップページに機器が表示される。<br>
4.トップページの機器idから機器詳細画面へ遷移できます。（詳細画面ではトップページに表示されない情報も表示）<br>
5.機器詳細画面の編集ボタンから機器情報を編集可能（所有ユーザもしくは管理者のみ編集画面へ遷移できる）

##  管理ユーザ機能(ユーザ管理)
1.管理ユーザでログインする<br>
2.トップページのユーザ一覧ボタンからユーザ一覧へ遷移<br>
3.変更するユーザの行の編集ボタンから編集画面へ遷移<br>
4.ユーザの情報を変更や、管理者権限を与える

## 管理者ユーザ機能（機器管理）
1.管理者ユーザでログイン<br>
2.トップページにアプリに登録されている機器がすべて表示される<br>
3.変更が必要な機器の機器idを選択し、詳細画面>編集画面へ遷移し情報を編集する

## 検索機能
1.トップページ右側の検索バーで機器idを入力して検索ボタンを押すことでid検索が可能<br>
2.トップページ左の検索バーは機器名、S/N、所有者名を入力し検索ボタンを押すことで部分一致で検索可能<br>
3.トップページの検索バー下のカテゴリ検索ボタンや利用状況検索ボタンをクリックすると<br>
  選択ボックスが表示され、キーワードを選択するし検索ボタンを押すとそのキーワードに該当する機器を表示させる<br>
※2,3は重複で検索ができる。例えば、デスクトップ+所有者名といった検索が可能

## CSV出力機能
1.トップページのcsv出力ボタンから機器一覧に表示されている機器情報をcsv出力可能<br>
2.通常ユーザは、所有している機器、管理者ユーザは全ての機器をcsv出力できる<br>
3.管理者ユーザは、ユーザ一覧からユーザ情報もcsv出力出来る<br>
※ログインしていないユーザは、csv出力ボタンが表示されない。機器が1つもない場合は、headerだけ表示されたcsvファイルが出力される


# アプリケーションを作成した背景
私自身が情報機器の管理業務に携わる中で、人事異動に伴う情報の変更であったり、<br>
特に、定期的な機器の現物調査で遠方の事業所の調査に手間と時間が掛かるという経験があった。<br>
そこで、ユーザにある程度の情報の変更権限を与え、機器管理者の変更作業の手間を削減したいという思いからアプリを作成しました。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1iJahYlXnsDaQsLCb23EwTnltDe-ZBCcebwMO7rQkq6c/edit?usp=sharing

# 実装した機能についての画像やGIFおよびその説明
## 新規ユーザ登録
  gif:(https://github.com/masayareb/idm-app/assets/121111710/c66091c3-90cc-42df-8bee-f620cb196ccf)<br>
  ・社員が入社した際に新規にユーザを登録することが出来る<br>
  ・名前・社員番号・所属・メールアドレス・パスワードを設定して登録ボタンを選択し、作成する<br>
  ・メールアドレスやパスワードは入力制限をクリアした値で入力されないとエラーが表示され登録ができない

## ユーザ情報変更
  gif:(https://github.com/masayareb/idm-app/assets/121111710/1d273d9f-fea6-4bfa-b7e9-f490455b6e89)<br>
  ・人事異動や結婚等でユーザ情報が変更が発生した際に変更することが出来る<br>
  ・変更したい項目を記述し、現在のPWを入力し、更新ボタンを選択<br>
  ・新規作成と同様に入力制限をクリアした値でないと変更ができない<br>
  ※ヘッダーのアイコンを選択するとこで、変更せずにトップページへ遷移することも可能

## 新規機器登録
  gif:(https://github.com/masayareb/idm-app/assets/121111710/018f17b7-bb54-4aa9-a408-e019b6f9aee1)<br>
  ・新規に情報機器を導入した際に登録出来る<br>
  ・社員番号・状態・機器種類・機器名・メーカー・IPアドレス・S/N・購入年月・利用予定年数を入力して登録ボタンを選択<br>
    社員番号・IPアドレス・S/N・利用予定年数に入力制限にクリアした値で入力されていないとエラーが表示され登録できない<br>
    ※任意入力として、備考・ファイル添付ができる。<br>
  ・入力した社員番号に該当するユーザのトップページへ登録した機器が表示される。

## 機器詳細表示
  gif(https://github.com/masayareb/idm-app/assets/121111710/6d213e1a-6676-4702-800c-6fe0c370244b)<br>
  ・トップページではすべての項目を表示していないため、必要に応じで詳細画面で機器情報を閲覧出来る<br>
  ・トップページより、詳細を表示したい機器idを選択することで機器詳細画面へ遷移し、機器の詳細を閲覧することができる<br>
  ・機器情報を編集する際は画面下の編集ボタンから編集画面へ遷移する

## 機器情報変更
  gif:(https://github.com/masayareb/idm-app/assets/121111710/8ae2b574-7f49-4150-b59c-59f3dd3c1ef4)<br>
  ・機器の情報に誤りや、状態、利用ユーザに変更があった場合に情報を変更することが出来る<br>
  ・編集画面より、変更したい項目を変更し登録することで変更出来る<br>
  ・社員番号が空欄になってしまうので、必ず入力する（！改善予定！）<br>
  ・新規登録と同様に入力制限をクリアしなければ登録されない

## 管理ユーザ機能
  gif:(https://github.com/masayareb/idm-app/assets/121111710/b8b19d5e-2574-4fd7-8171-aa4f9a1cf0b1)<br>
  ・管理者ユーザはアプリに登録されている全ユーザ、全機器の編集権限を持つ。また、ユーザを管理者ユーザ設定を付与できる<br>
  ・管理者ユーザでログインすると、トップページに登録されているすべての機器、ユーザ一覧ボタンが表示される<br>
  ・ユーザ一覧ボタンより、ユーザ一覧表示画面へ遷移し、編集ボタンをクリックすることで、PW不要でユーザ情報を編集・管理者権限を付与することが出来る。<br>
  ・機器情報編集については、5.機器情報変更と同様の操作となる

## 検索機能
  gif:(https://github.com/masayareb/idm-app/assets/121111710/d18eeabb-b9b7-4722-be6f-70a67008aabc)<br>
      (https://github.com/masayareb/idm-app/assets/121111710/4ca05a3d-43e6-4c39-98a1-dd27da2b7d59)<br>
  ・登録されている機器から該当の機器を検索することが出来る

## CSV出力機能(2023/6/2機能追加)
  gif:(https://github.com/masayareb/idm-app/assets/121111710/7ea3d7cc-8500-453d-8e49-d81a1378d7cf)
      (https://github.com/masayareb/idm-app/assets/121111710/38a75854-459c-4f5f-97cd-8592785d8b72)
  ・ユーザが所有している機器情報をcsv出力することができる。
  ・管理者は全機器、前ユーザ情報を出力することができる
  

# 実装予定の機能
・CSV入力機能<br>
・変更履歴管理機能<br>
・メール通知機能

# データベース設計
データベース設計.dioを参照

# 画面遷移
画面遷移.dioを参照


# テーブル設計
## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------  | ------------------------ |
| name               | string  | null: false              | #名前
| password           | string  | null: false              | #パスワード
| email              | string  | null: false,unique: true | #メールアドレス
| employee_number    | string  | null: false,unique: true | #社員番号
| affiliation        | string  | null: false              | #所属
| admin              | boolean | null: false,null: false  | #管理者ユーザ判定

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
| serial_number      | string     | null: false,unique: true       | #S/N
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

## user_histories テーブル（未実装）

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| change_type          | string     | null: false                    | #変更方法
| change_data          | jsonb      | null: false                    | #変更内容
| user                 | references | null: false, foreign_key: true | #ユーザid

### Association
- belongs_to :user


## item-histories テーブル（未実施）

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| change_type          | string     | null: false                    | #変更方法
| change_data          | jsonb      | null: false                    | #変更内容
| item                 | references | null: false, foreign_key: true | #アイテムid


### Association
- belongs_to :item

# 開発環境
・フロントエンド：HTML,CSS,Javascript<br>
・バックエンド：Ruby(ruby on rails),MySQL<br>
・インフラ：render<br>
・テスト：rspec<br>
・テキストエディター：Visual Studio Code<br>
・タスク管理：GitHub,Notion

# 工夫したポイント
・入力した社員番号を元に機器idとユーザidを紐づける設定を行なった<br>
  これにより、入力した社員番号に該当するユーザの機器を登録が出来ること<br>
・機器とユーザ情報が紐づいているため、ユーザの所属を変更すると<br>
  機器の所属情報も変更されるため、二重で変更する手間をなくしていること<br>
・カテゴリや利用状況で絞り込みが出来るため、<br>
  廃棄済の機器や、デスクトップ以外は表示させない等の検索を可能としていること

