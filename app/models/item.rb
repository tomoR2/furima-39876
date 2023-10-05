class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_days

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :item_name, :concept, :image, presence: true
  validates :category_id, :condition_id, :delivery_charge_id, 
  :delivery_days_id, :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
