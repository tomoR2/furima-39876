class ItemsController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :edit ,:destroy]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = items.all
  end

  def new
    @item = item.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end


  # def prototype_params
  #   params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  # end

  # def comment_params
  #   params.require(:comment).permit(:content).merge(user_id: current_user.id , prototype_id:@prototype.id)
  # end
  

  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  # def item_params
  #   params.require(:item).permit(:name, :image, :text)
  # end


end
