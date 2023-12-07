class Order < ApplicationRecord
  has_one :product
  has_one :shipping
end
