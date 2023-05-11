class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '1.デスクトップPC' },
    { id: 2, name: '2.ノートPC' },
    { id: 3, name: '10.複合機' },
    { id: 4, name: '20.Ipad' },
    { id: 5, name: '30.Wi-Fiルータ' },
    { id: 6, name: '31.モバイルルータ' }
  ]
  include ActiveHash::Associations
  has_many :items
  end