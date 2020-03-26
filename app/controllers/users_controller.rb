class UsersController < ApplicationController
  def show
    
    seller = Item.group(:seller_id).count
    @number_of_exhibitions_item = seller[current_user.id]

  end
end
