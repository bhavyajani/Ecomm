class Order < ApplicationRecord
    belongs_to :user
    has_many :order_details
    after_initialize :set_order_date
    before_save :set_total
    enum status: {pending: 0, placed: 1, delivered: 2}

    
    def total 
        order_details.collect{|order_detail| order_detail.valid? ? order_detail.sub_total : 0}.sum
    end

    def set_total
        self[:total_amount] = total
    end

    private def set_order_date
        self[:order_date] = Date.today
    end
end