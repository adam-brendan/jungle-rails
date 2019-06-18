require 'rails_helper'

RSpec.feature "Visitor adds an item to cart and the cart counter increases", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the cart counter increase" do
    # ACT
    visit root_path
    puts page.html
    find('footer [action="/cart/add_item?product_id=10"]').click
    sleep(1)

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_content("My Cart (1)")
  end
end