class OrderDetailsController < ApplicationController
    def create
        @order = current_order
        @order.user_id = current_user.id
        @product_id = params[:order_detail][:product_id].to_i
        @quantity = params[:order_detail][:quantity].to_i
        @is_detail_present = @order.order_details.find_by(product_id: @product_id)

        if !current_user.is_cart_empty && @is_detail_present!=nil            
           @order_detail = @order.order_details.find_by(product_id: @product_id)
           @order_detail.quantity += @quantity
           @order_detail.save!
        else    
            @order_details = @order.order_details.new(order_params)
            current_user.is_cart_empty = false
            current_user.save!
        end  
        @order.save!
        session[:order_id] = @order.id
    end

    def new
    end

    def update
        @order = current_order
        @order_detail_id = params[:id].to_i
        @order_detail = @order.order_details.find_by(id: @order_detail_id)
        respond_to do |format|
            if @order_detail.update_attributes(order_params)
                format.html { redirect_to carts_path, notice: 'Cart Updated.' }
            else
                format.html { render :edit } 
            end
        end
        @order.save!
    end

    def destroy
        @order = current_order
        @order_detail_id = params[:id].to_i
        @order_detail = @order.order_details.find_by(id: @order_detail_id)
        @order_detail.destroy
        respond_to do |format|
            format.html { redirect_to carts_path, notice: 'Item was removed from the cart.' }
        end
        @order.save!
    end

    private def order_params
        params.require(:order_detail).permit(:product_id, :quantity)
    end
end
