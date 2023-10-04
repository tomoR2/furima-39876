class ItemsController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :edit ,:destroy]
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
  end

  # def prototype_params
  #   params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  # end

  # def comment_params
  #   params.require(:comment).permit(:content).merge(user_id: current_user.id , prototype_id:@prototype.id)
  # end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
