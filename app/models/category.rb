class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '和食' },
    { id: 3, name: '洋食' },
    { id: 4, name: '中華料理' },
    { id: 5, name: 'ファミレス' },
    { id: 6, name: 'カフェ' },
    { id: 7, name: '喫茶店' },
    { id: 8, name: '定食・食堂' },
    { id: 9, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :stores
end