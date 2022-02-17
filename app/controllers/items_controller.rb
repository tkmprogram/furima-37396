class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @item.user.id =! current_user.id or @item.order.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :category_id, :situation_id, :shipping_charge_id, :prefecture_id, :send_day_id, :price,
                                 :title, :explanation).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
