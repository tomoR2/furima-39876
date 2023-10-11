class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, 
  :street_address, :building_name, :phone_number

  with_options presence: true do
  #  orderのバリデーション
    validates :user_id
    validates :item_id

  #  addressのバリデーション
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :street_address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }

    #  tokenのバリデーションあとでつかう
    # validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(
      post_code: post_code, prefecture_id: prefecture.id, municipality: municipality, street_address: street_address, 
      phone_number: phone_number, building_name: building_name, order_id: order.id )
  end



