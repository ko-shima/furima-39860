class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order = OrderShipping.new
  end

  def create
    binding.pry
  end

end
