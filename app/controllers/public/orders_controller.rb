class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      @cart_items.each do |cart|
        @order_item = OrderItem.new
        @order_item.item_id = cart.item_id
        @order_item.order_id = @order.id
        @order_item.order_quantity = cart.quantity
        @order_item.order_price = cart.item.price
        @order_item.save
      end
      redirect_to orders_thanks_path
      @cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def check
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    @order = Order.new(order_params)

    if params[:order][:address_number] == "1"
      @order.name = current_customer.name
      @order.address = current_customer.customer_address

    elsif params[:order][:address_number] == "2"
      @address_new = current_customer.addresses.new(address_params)
      if @address_new.save
      else
        render :new
      end

    else
      redirect_to :cart_items_path
    end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def check

  end

  def thanks

  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :total_payment, :postal_code,:shipping_cost)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end


end
