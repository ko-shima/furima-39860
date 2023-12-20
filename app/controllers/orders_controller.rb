class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new
  end

  def create
    binding.pry
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
    params.require(:order_shipping).permit(:postal_code, :region_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id)
  end

  #def shipping_params
  #  params.permit(:postal_code, :region_id, :city, :block, :building, :phone_number)
  #end
end
