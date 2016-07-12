require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "#index" do
    it "renders the products page" do
      get :index
      expect(response).to have_rendered("products/index")
    end
  end

  describe "#new_product" do
    it "renders the new products page form" do
      get :new
      expect(response).to have_rendered("products/new")
    end
  end
end
