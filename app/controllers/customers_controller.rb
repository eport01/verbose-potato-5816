class CustomersController < ApplicationController
  def show 
    @customer = Customer.find(params[:id])
    if params[:customer_id]
      CustomerItem.create!(customer: @customer, item: Item.find(params[:customer_id].to_i))
    end
  end
end