class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '10.デスクトップPC' },
    { id: 2, name: '11.ノートPC' },
    { id: 3, name: '20.複合機' },
    { id: 4, name: '30.Ipad' },
    { id: 5, name: '40.Wi-Fiルータ' },
    { id: 6, name: '41.モバイルルータ' }
  ]
  include ActiveHash::Associations
  has_many :items
  end