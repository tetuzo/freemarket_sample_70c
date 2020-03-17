class ItemsController < ApplicationController
  def index
   
  end

  def show
  end

  def new
    @category_parent_array = ["選択してください"]
    #データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
         @category_parent_array << parent.name
      end
  end

  def create
  end

  def search_child  
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def search_grandchild
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
end
