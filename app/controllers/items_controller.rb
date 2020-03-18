class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images)
  end

  def show
  end

  def new

    @item = Item.new
    @item.images.new
    @category_parent_array = ["選択してください"]
    # データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      redirect_to new_item_path
    end
  end

  def search_child  
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def search_grandchild
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private
  def item_params
    params.require(:item).permit(:name, :discription, :shipping_charges_id, :shipping_days_id, :price, :size_id, :category_id, :prefecture_id, :brand_id, :status_id, images_attributes: [:image])
  end

  
end
