class Product < ApplicationRecord
  validates :category_id, presence: true
  validates :situation_id, presence:true
  validates :shipping_charge_id, presence:true
  validates :prefecture_id, presence: true
  validates :send_day_id, presence: true
  validates :price, presence: true
  validates :title, presence: true
  validates :explanation, presence: true
  validates :user, presence: true

  belongs_to :user

  has_one_attached :image
end
