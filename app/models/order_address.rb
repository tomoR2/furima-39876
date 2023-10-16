class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, 
  :street_address, :building_name, :phone_number, :token

  with_options presence: true do
  #  orderのバリデーション
    validates :user_id
    validates :item_id

  #  addressのバリデーション
    validates :municipality
    validates :street_address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { only_integer: true, other_than: 1, message: "can't be blank" }
  
    #  tokenのバリデーション
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(
      post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, street_address: street_address, 
      phone_number: phone_number, building_name: building_name, order_id: order.id )
  end
end



