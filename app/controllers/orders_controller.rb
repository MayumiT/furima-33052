class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :new
  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    else
      render :index
    end
  end
  
  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def order_params
    params.require(:order_address).permit(:post_code, :area_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
