require 'rails_helper'

RSpec.describe 'items index page', type: :feature do 
  describe 'as a visitor to items index' do 
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

    it 'i see a list of all of the items including name, price, and supermarket' do 
      visit '/items'
      expect(page).to have_content("Rice: $2, Aldi")
    end

    it 'i see a count of customers that bought that each item' do 
      expect(page).to have_content("Rice: $2, Aldi, 2 customers have bought this item")

    end
  end
end