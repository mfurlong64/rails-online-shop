require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "#index" do
    it "renders the products page" do
      get :index
      expect(response).to have_rendered("products/index")
    end
  end
end
