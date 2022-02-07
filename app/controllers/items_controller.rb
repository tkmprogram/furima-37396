class ItemsController < ApplicationController

  def index
  end

  private

  def item_params
    params.require(:product).permit(:image).merge(user_id:)
  end
end
