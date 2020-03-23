class OrderDetailsController < ApplicationController
    def create
        @order = current_order
        @order.user_id = current_user.id
        @order_detail = @order.order_details.new(order_params)
        
        @order.total_amount = @order.order_details.collect{|order_detail| order_detail.valid? ? order_detail.sub_total : 0}.sum    
        @order.save!
        current_user.is_cart_empty = false
        #render plain: @order.inspect
        session[:order_id] = @order.id
    end

    def new
    end

    private def order_params
        params.require(:order_detail).permit(:product_id, :quantity)
    end
end
