class ItemsController < ApplicationController

  def index
  end

  def new
  end

  private

  def item_params
    params.require(:product).permit(:image)
  end
end
