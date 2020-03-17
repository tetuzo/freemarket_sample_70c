class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images)
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      redirect_to new_item_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :discription, :status_id, :shipping_charges_id, :shipping_days_id, :price, :size_id, :brand_id, :prefecture_id, images_attributes: [:image])
  end

  
end
