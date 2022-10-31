class Supermarket < ApplicationRecord
  has_many :items

  def customer_list 
    items.map {|item| item.customers.distinct.pluck(:name)}.flatten.uniq 
  end
end