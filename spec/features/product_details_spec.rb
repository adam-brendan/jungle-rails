require 'rails_helper'

RSpec.feature "Visitor navigates from the home page to the product detail page", type: :feature, js: true do

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

  scenario "They see product details" do
    # ACT
    visit root_path
    find('footer a[href="/products/9"]').click
    sleep(1)

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_css 'section.products-show'
  end
end