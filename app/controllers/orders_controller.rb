class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :find_item, only: [:index, :create]



  def index
    @order_send = OrderSend.new
    if @item.user_id == current_user.id or @item.order.present?
      redirect_to root_path
    end
  end



  def create
    @order_send = OrderSend.new(send_params)
    if @order_send.valid?
      pay_item
      @order_send.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def send_params
    params.require(:order_send).permit(:post_code, :prefecture_id, :municipalities, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: send_params[:token],
      currency: 'jpy'
    )
  end



end
