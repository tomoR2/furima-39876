class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, 
  :street_address, :building_name, :phone_number, :order_id

  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

    validates :item_name, :concept, :image, presence: true
    validates :price, numericality: {
      only_integer: true,
      greater_than_or_equal_to: 300,
      less_than_or_equal_to: 9_999_999,
      message: '半角数字300～9999999で設定ください'
    }
    validates :category_id, :condition_id, :delivery_charge_id,
              :delivery_days_id, :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
end
