class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1~2日後' },
    { id: 3, name: '2~3日後' },
    { id: 4, name: '4~7日後' }
  ]

  include ActiveHash::Associations
  has_many :items
  end