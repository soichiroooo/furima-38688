class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Item.new
  end

  private

  # def item_params
  #   params.require(:item).permit(:name,:price,:explanation,:category_id,:condition_id,:shipping_charge_id,:prefecture_id,:shipping_date_id).merge(user_id: current_user.id)
  # end
end
