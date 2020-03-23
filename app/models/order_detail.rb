class OrderDetail < ApplicationRecord
    belongs_to :product
    belongs_to :order
    before_save :set_unit_price
    before_save :set_sub_total

    def unit_price
        if persisted?
            self[:unit_price]
        else
            product.price
        end
    end

    private def set_unit_price
        self[:unit_price] = unit_price
    end

    def sub_total
        unit_price * quantity
    end

    private def set_sub_total
        self[:sub_total] = sub_total
    end
end