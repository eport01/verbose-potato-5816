class CustomersController < ApplicationController
  def show 
    @customer = Customer.find(params[:id])
    if params[:item_id]
      CustomerItem.create!(customer: @customer, item: Item.find(params[:item_id].to_i))
    end
  end
end