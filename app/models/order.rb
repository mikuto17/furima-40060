class Order < ApplicationRecord
  attr_accessor :token
  has_one :product
  has_one :shipping
end
