class Supermarket < ApplicationRecord
  has_many :items

  def customer_list 
    items.map {|item| item.customers.map{|customer| customer.name}}.flatten.uniq
  end
end