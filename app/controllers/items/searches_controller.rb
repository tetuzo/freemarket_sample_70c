class Items::SearchesController < ApplicationController
  def index
    @items = Item.search(params[:keyword]).limit(132)
  end
end
