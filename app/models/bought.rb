class Bought < ApplicationRecord
belongs_to :user
belongs_to :product
has_one :shipping
end