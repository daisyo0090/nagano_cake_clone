class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @cart_items = current_customer.cart_items
    @order = current_customer.orders.new(order_params)
    @order.save
    @cart_items.each do |cart_item|
      @order_detail = @order.order_details.new
      @order_detail.item_id = cart_item.item.id
      @order_detail.price = cart_item.item.price
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end
    @cart_items.destroy_all
    redirect_to orders_thanks_path
  end

  def check
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @cart_items = current_customer.cart_items

    if params[:order][:address_number] == "1"
      @order.name = current_customer.last_name + current_customer.first_name
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
    elsif params[:order][:address_number] == "2"
      @address_new = current_customer.addresses.new(address_params)
      @address_new.save
      @order.name = current_customer.last_name + current_customer.first_name
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
    else
      redirect_to :cart_items_path
    end
    @cart_items = current_customer.cart_items
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def thanks

  end

  private

  def order_params
    params.require(:order).permit(:postal_code,:address,:name,:shipping_cost,:total_payment,:payment_method)
  end

  def address_params
    params.require(:address).permit(:name, :address)
  end


end
