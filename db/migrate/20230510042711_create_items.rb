class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :status_id ,null: false #状態
      t.string  :item ,null: false #商品名
      t.integer :category_id ,null: false #カテゴリー
      t.string :manufacturer ,null: false #メーカー
      t.integer :serial_number ,null: false,unique: true #S/N
      t.string :ip ,null: false #IPアドレス
      t.date :purchase_date ,null: false #購入年月
      t.integer :years_of_use ,null: false #利用予定年数
      t.text :remarks ,null: false #備考
      t.references :user ,null: false, foreign_key: true  #ユーザid

      t.timestamps
    end
  end
end
