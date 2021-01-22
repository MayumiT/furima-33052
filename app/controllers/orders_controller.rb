class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def order_params
    #params.permit(:item_id).merge(user_id:current_user.id)
    params.require(:order_address).permit(:user_id, :item_id, :post_code, :area_id, :city, :house_number, :building_name, :phone_number, :order_id)
  end
end
