class OrdersController < ApplicationController
    def show
        #render plain: current_order.inspect
        @order = Order.find_by(id: session[:order_id])
        @order_details = @order.order_details
        if @order.status == 'pending'
            @title = 'Your Current Order Details'
        elsif @order.status == 'placed'
            @title = 'Your order has been placed!'
        else
            @title = 'Your order was delivered'
        end
    end

    def update_cart_status
        @order = Order.find_by(id: session[:order_id])
        @order.status = 1
        @order.user.is_cart_empty = true
        @order.save!
        @order.user.save!
        #current_order = Order.new()
        respond_to do |format|
            format.html { redirect_to orders_path }
        end
    end
end
