class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  belongs_to :customer
  has_many :order_details

  def  add_tax_price
    (self.price * 1.08).round
  end
end
