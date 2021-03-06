class Public::CustomersController < ApplicationController
  def show

  end

  def edit
    @customer = current_customer
  end

  def seeyou
    current_customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_path
  end

  def customer_params
    params.require(:customer).permit(:email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active)
  end
end
