class OrdersController < ApplicationController

  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @order_form = OrderForm.new
  end

end
