class ItemsController < ApplicationController
  before_action :authenticate_user,   only: [:new ]
  before_action :set_item,            only: [:buy, :destroy]
  
  def index
    @items = Item.includes(:images)
  end

  def show
    @item = Item.find(params[:id])
    @images = Image.where(item_id: @item[:id]).order("updated_at DESC").limit(5)
    @user = User.find(@item[:seller_id])
    status = Status.find(@item.status_id)
    shipping_charges = ShippingCharges.find(@item.shipping_charges_id)
    prefecture = Prefecture.find(@item.prefecture_id)
    category = Category.find(@item.category_id)
    shipping_days = ShippingDays.find(@item.shipping_days_id)
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

  def buy
    if item.update(buyer_id: current_user.id)
      redirect_to done_purchase_index_path
    else
      redirect_to purchase_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render 'new'
    end
  end

  def destroy
    if item.destroy
      flash[:notice] = "商品情報を削除しました"
      redirect_to root_path
    end
  end

  def search_child  
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def search_grandchild
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def authenticate_user
    redirect_to new_user_session_path unless user_signed_in?  
  end

  private
  def item_params

    params.require(:item).permit(:name, :discription, :shipping_charges_id, :shipping_days_id, :price, :size_id, :category_id, :prefecture_id, :brand_id, :status_id, images_attributes: [:image]).merge(seller_id: current_user.id)

  end

  def set_item
    item = Item.find(params[:id])
  end
end
