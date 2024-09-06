class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.save
      redirect_to root_path  
    else 
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find_by(id: params[:item_id])
    unless @item
      redirect_to root_path
      return # ここでアクションを終了させる
    end
  end

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
