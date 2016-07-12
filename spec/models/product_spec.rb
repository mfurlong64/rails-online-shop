require 'rails_helper'
 # pending "add some examples to (or delete) #{__FILE__}"

RSpec.describe Product, type: :model do
  describe Product do
    context "#save" do
      let(:product) { build :product}
      it "return true" do
        expect {
          product.save
        }.to change(Product,:count).by(1)
      end

      it "return false when name is nil" do
        product.name = nil
        expect {
          product.save
        }.not_to change(Product,:count)
      end

      it "return false when price is nil" do
        product.price = nil
        expect {
          product.save
        }.not_to change(Product,:count)
      end
      it { should validate_presence_of :name}
      it { should validate_presence_of :price}
    end
  end
end
