class Supermarket < ApplicationRecord
  has_many :items

  def customer_list 
    # items.map {|item| item.customers.map{|customer| customer.name}}.flatten.uniq
    items.map {|item| item.customers.distinct.pluck(:name)}.flatten.uniq 
    # items.each do |item|
      #item.customers.pluck(:name)
    # end
    # @items = Item.all 
    # @item = Item.find(params[:id])
    # @item = Customer.find(params[:id])

    # CustomerItem.create!(customer: @customer, item: @item)
    # @items.each do |item|
    #   item.customers
      
    # end
    # Customer.find(:id)
  end
end