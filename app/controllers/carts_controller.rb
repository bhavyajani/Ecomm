class CartsController < ApplicationController
  def show
    @order_details = current_order.order_details
    if @order_details.size == 0
      @body = 'Your cart is empty'
    else 
      @body = ''
    end
  end
end
