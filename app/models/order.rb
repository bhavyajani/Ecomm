class Order < ApplicationRecord
    belongs_to :user
    has_many :order_details
    after_initialize :set_order_date
    enum status: {pending: 0, placed: 1, delivered: 2}

    private def set_order_date
        self[:order_date] = Date.today
    end
end