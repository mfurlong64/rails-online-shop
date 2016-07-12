require 'rails_helper'

RSpec.feature "Products", type: :feature do
  describe "#index" do
    let!(:product) { create :product }
    it "should list all the product2" do
      visit root_path
      expect(page).to have_content(product.name)
    end
  end
  describe '#new_product' do
    it "should click in the forms and return the success message" do
      visit new_product_path
      fill_in 'Name', with: 'Party Ballon'
      fill_in 'Photo', with: 'nada'
      fill_in 'Description', with: 'nada'
      fill_in 'Price', with: 'nada'
      click_button 'Create Product'
      expect(page).to have_content("Party Ballon")
    end
  end
end
