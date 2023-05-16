class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: 'デスクトップPC' },
    { id: 2, name: 'ノートPC' },
    { id: 3, name: '複合機' },
    { id: 4, name: 'Ipad' },
    { id: 5, name: 'Wi-Fiルータ' },
    { id: 6, name: 'モバイルルータ' }
  ]
  include ActiveHash::Associations
  has_many :items
  end