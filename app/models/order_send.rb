class OrderSend
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :address, :building, :tel

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :municipalities
    validates :address
    validates :tel, format: { with: /\A[0-9]+\z/, message: "is invalid. Input only number"}, length: {minimum: 10, maximum: 11, }
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Cend.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, tel: tel, order_id: order.id)
  end
end