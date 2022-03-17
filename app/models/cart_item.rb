class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  def  add_tax_price
    (self.price * 1.08).round
  end
end
