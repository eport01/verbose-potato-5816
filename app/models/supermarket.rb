class Supermarket < ApplicationRecord
  has_many :items
  has_many :customers, through: :items

  # def customer_list 
  #   items.map {|item| item.customers.distinct.pluck(:name)}.flatten.uniq 
  # end


  def customer_list 
    customers.select(:name).distinct.pluck(:name) 
  end
end