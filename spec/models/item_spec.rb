require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items}
    it { should have_many(:customers).through(:customer_items)}
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
  it 'returns a count of customers that bought that item' do 
    expect(@rice.purchase_count).to eq(2)
    expect(@turkey.purchase_count).to eq(1)
  end
end
