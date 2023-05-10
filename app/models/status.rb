class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '使用中' },
    { id: 2, name: '予備機' },
    { id: 3, name: '修理中' },
    { id: 4, name: '貸出中' },
    { id: 5, name: 'リース返却' },
    { id: 6, name: '廃棄' }
  ]
  include ActiveHash::Associations
  has_many :items
  end