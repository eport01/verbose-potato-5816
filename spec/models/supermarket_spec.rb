require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :items }
  end
  before :each do 
    @whole_foods = Supermarket.create!(name: "Whole Foods", location: "Denver")
    @aldi = Supermarket.create!(name: "Aldi", location: "Aurora")
    @mary = Customer.create!(name: "Mary")
    @steve = Customer.create!(name: "Steve")
    @jim = Customer.create!(name: "Jim")
    @zoe = Customer.create!(name: "Zoe")
    @rice = @aldi.items.create!(name: "Rice", price: 2)
    @cheese = @aldi.items.create!(name: "Cheese", price: 4)
    @bread = @aldi.items.create!(name: "Bread", price: 3)
    @turkey = @whole_foods.items.create!(name: "Turkey", price: 8)
    CustomerItem.create!(customer: @mary, item: @rice)
    CustomerItem.create!(customer: @mary, item: @cheese)
    CustomerItem.create!(customer: @mary, item: @turkey)
    CustomerItem.create!(customer: @jim, item: @rice)
  end
  it 'returns a list of customers who have shopped at a supermarket' do 
    # require 'pry'; binding.pry
    expect(@aldi.customer_list).to eq(['Jim', 'Mary'])
  
  end
end