class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :create]
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def move_to_index
    return if user_signed_in?

    redirect_to action: :index
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :concept, :category_id, :condition_id, :delivery_charge_id, :prefecture_id,
                                 :delivery_days_id, :price).merge(user_id: current_user.id)
  end
end
