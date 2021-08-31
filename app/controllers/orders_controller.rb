class OrdersController < ApplicationController
  def index
    @order_ship = OrderShip.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @order_ship = OrderShip.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_ship.valid?
      @order_ship.save
      redirect_to root_path
    else
      render :index
    end      
  end  

  private
  
  def order_params
    params.require(:order_ship).permit(:postcode, :prefecture_id, :city, :block, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end  
end
