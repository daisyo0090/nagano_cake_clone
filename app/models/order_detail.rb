class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def  add_tax_price
    (self.price * 1.08).round
  end

end
