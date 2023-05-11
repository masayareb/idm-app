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
  validates :image, presence: true
  validates :manufacturer, presence: true
  #S/N英数字のみ
  validates :serial_number, presence: true,uniqueness: true, format: { with: /\A[A-Za-z0-9]+\z/ }
  #192.168.000.000形式もしくはDHCP
  validates :ip, presence: true, format: { with: Resolv::IPv4::Regex }
  #yyyy-mm-dd形式
  validates :purchase_date, presence: true, format: { with: /\A\d{4}-\d{3}-\d{2}\z/ }
  #y年表示
  validates :years_of_use, presence: true, format: { with: /\A[0-9]+\z/ }
end
