class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.order("updated_at DESC").limit(6)
    @images = Image.order("updated_at DESC").limit(6)
  end

  def show
  end
    
  def new
  end

  def create
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
end
