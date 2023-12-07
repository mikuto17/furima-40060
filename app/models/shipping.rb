class Shipping < ApplicationRecord
  belongs_to :bought
  has_one :order
end
