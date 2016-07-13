class Product < ActiveRecord::Base
   validates :name, presence: true, length: { minimum: 3 }
   validates :price, presence: true
   validates :stock, presence: true, numericality: { only_integer: true }
   validates :price, numericality: true
end
