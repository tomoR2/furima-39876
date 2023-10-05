class DeliveryDays < ActiveHash::Base
  self.data = [
    { id: 1, days: '---' },
    { id: 2, days: '1~2日後' },
    { id: 3, days: '2~3日後' },
    { id: 4, days: '4~7日後' }
  ]

  include ActiveHash::Associations
  has_many :items
  end