class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_send = OrderSend.new
  end



  def create
    @item = Item.find(params[:item_id])
    @order_send = OrderSend.new(send_params)
    if @order_send.valid?
      @order_send.save
      redirect_to items_path
    else
      render :index
    end
  end

  private



  def send_params
    params.require(:order_send).permit(:post_code, :prefecture_id, :municipalities, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
