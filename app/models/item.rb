class ItemsController < ApplicationRecord
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :situation_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_charge_id, presence:true
  validates :prefecture_id, presence: true
  validates :send_day_id, presence: true
  validates :price, presence: true
  validates :title, presence: true
  validates :explanation, presence: true
  validates :user, presence: true

  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :situation
end
