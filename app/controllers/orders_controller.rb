class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @order_ship = OrderShip.new
    transition_top
  end
  
  def create
    @order_ship = OrderShip.new(order_params)
    if @order_ship.valid?
      pay_item
      @order_ship.save
      redirect_to root_path
    else
      render :index
    end      
  end  

  private
  
  def order_params
    params.require(:order_ship).permit(:postcode, :prefecture_id, :city, :block, :building, :telephone_number).
                                      merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end  

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end  

  def transition_top
    if current_user.id == @item.user_id 
      redirect_to root_path
    else 
      if @item.order.present?
        redirect_to root_path 
      end  
    end  
  end  
end
