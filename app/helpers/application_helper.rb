module ApplicationHelper
    def current_order
        if !session[:order_id].nil? && !Order.find_by(id: session[:order_id], status: 0).nil?
            Order.find(session[:order_id])
        elsif current_user!=nil && !current_user.is_cart_empty
            Order.find_by(user_id: current_user.id, status: 0)
        else
            Order.new()
        end
    end
end
