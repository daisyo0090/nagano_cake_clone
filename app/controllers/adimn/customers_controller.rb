class CustomersController < ApplicationController
  def index
    @customers = Costomer.all
  end
  
  def show
    @customer = Costomer.find(params[:id])
  end
  
  def edit
    @customer = Costomer.find(params[:id])
  end
  
  def update
    @customer = Costomer.find(params[:id])
    @customer.update
    redirect_to customer_path(:id)
  end
  
end
