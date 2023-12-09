class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, only: :edit

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :price, :category_id, :condition_id, :postage_id, :region_id,
                                 :shipping_data_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    user_id = item.user_id

    return if user_signed_in? && current_user.id == user_id

    redirect_to action: :index
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
