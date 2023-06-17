#この記述でResolv::IPv4::Regexを使用することができる
require 'resolv'

class Item < ApplicationRecord
  #アソシエーション
  belongs_to :user

  #Active Strageのアソシエーション
  has_one_attached :image

  #ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :category
  belongs_to :status

  #バリデーションを記述
  validates :status_id, presence: true 
  validates :item, presence: true
  validates :category_id, presence: true
  validates :manufacturer, presence: true
  #S/N英数字のみ
  validates :serial_number, presence: true,uniqueness: true, format: { with: /\A[A-Za-z0-9]+\z/ }
  #192.168.000.000形式もしくはDHCP
  validates :ip, presence: true, format: { with: /\A(?:DHCP|\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\z/ }
  #yyyy-mm-dd形式
  validates :purchase_date, presence: true
  #y年表示
  validates :years_of_use, presence: true


  #csv_import
  def self.import(file)
    all_count = 0
    failure_id = []
    failure_count = 0
    registration_count = 0
    alert = []
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      item = find_by(id: row["id"]) || new
      # 社員番号からuser.idを割り出す
      item.user = User.find_by(employee_number: row["社員番号"])
      # CSVからデータを取得し、設定する
      item.attributes = updatable_attributes(row)
      all_count += 1
      # 保存する
      if item.save
        registration_count += 1
      else
        failure_count += 1
        failure_id << row["id"]
      end
    end

    if failure_count == 0
      alert << "取り込み実施件数：#{all_count}件中、全件取り込み成功!"
      return alert
      #redirect_to items_import_page_path
    else
      alert << "取り込み実施件数：#{all_count}件中、取り込み失敗件数：#{failure_count}"
      failure_id.each do |id|
        alert << "取り込みエラー 対象id:#{id}"
      end 

      return alert
    end

  end

  def self.updatable_attributes(row)
    {id: row["id"], status_id: row["状態"], item: row["機器名"], category_id: row["機器種類"], manufacturer: row["メーカー名"], serial_number: row["S/N"], ip: row["IPアドレス"], purchase_date: row["購入年月"], years_of_use: row["利用予定年数"], remarks: row["備考"]}
  end


end
