require 'rails_helper' 

RSpec.describe 'customer show page', type: :feature do 
  describe 'as a visitor to the customer show page' do 
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
    it 'lists customers name and all of their items and item attributes, and supermarket they belong to' do 
      visit "/customers/#{@mary.id}"
      expect(page).to have_content("Mary: Rice, 2, Aldi Cheese, 4, Aldi Turkey, 8, Whole Foods")
    end

    it 'i can add an item to this customer' do 
      visit "/customers/#{@mary.id}"
      @grapes = @whole_foods.items.create!(name: "Grapes", price: 4)
      @jam = @whole_foods.items.create!(name: "Jam", price: 2)
      expect(page).to have_content("Add an item to this customer")
      fill_in :item_id, with: @grapes.id 
      click_button("Submit")
      expect(page).to have_content("Mary: Rice, 2, Aldi Cheese, 4, Aldi Turkey, 8, Whole Foods Grapes, 4, Whole Foods")
      save_and_open_page

    end
  end
end