class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
  end

  def create
    @order = Order.create(order_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private

  def order_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:post_code, :prefecture, :municipality, :street_address, :phone_number).merge(order_id: @order.id)
  end

end
