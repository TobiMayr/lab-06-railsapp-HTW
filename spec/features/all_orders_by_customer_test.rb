require 'rails_helper', 'capybara'

describe "create orders", :type => :feature do
  before :each do
    @customer = create(:customer)
    visit "/customers/#{@customer.id}"
    click_link 'New Order'
    click_button 'Create Order'
    fill_in 'Status', with: :new
    visit "/customers/#{@customer.id}"
    click_link 'New Order'
    click_button 'Create Order'
    fill_in 'Status', with: :new
  end
    it "shows orders" do
    visit "/customers/#{@customer.id}/orders"
    allorders = Order.all
    expect(page).to have_list 'All Orders'
  end
end
