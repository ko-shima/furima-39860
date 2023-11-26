class ItemsController < ApplicationController

  def index
  end

  def item_params
    params.require(:item).permit(:item_name, :description, :price, :category_id, :condition_id, :postage_id, :region_id, :shipping_data_id, :image).merge(:user_id: current_user.id)
  end

end
