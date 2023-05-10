class Item < ApplicationRecord
  #アソシエーション
  belongs_to :user

  #Active Strageのアソシエーション
  has_one_attached :image

  #ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :category
  belongs_to :status
end
