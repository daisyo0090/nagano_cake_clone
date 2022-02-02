class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  belongs_to :customer
  
  def  add_tax_sales_price
  (self.sales_price * 1.10).round
  end
end
