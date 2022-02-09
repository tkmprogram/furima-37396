class Item < ApplicationRecord
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :situation_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_charge_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :send_day_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :price, presence: true
  validates :title, presence: true
  validates :explanation, presence: true
  validates :user, presence: true
  validates :image, presence: true

  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :send_day
end
