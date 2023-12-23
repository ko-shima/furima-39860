class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
       @order_shipping.save
       redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_shipping).permit(:postal_code, :region_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  #def shipping_params
  #  params.permit(:postal_code, :region_id, :city, :block, :building, :phone_number)
  #end

  def move_to_index
    item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == item.user_id or item.order.present?
      redirect_to root_path
    end
  end

end
