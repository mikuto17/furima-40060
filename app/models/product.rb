class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :days_until
  belongs_to :burden

  belongs_to :user
  has_one :bought
  has_one_attached :image

  validates :image,presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 } 
  validates :condition_id, presence: true, numericality: { other_than: 1 } 
  validates :burden_id, presence: true,  numericality: { other_than: 1 } 
  validates :prefecture_id, presence: true,  numericality: { other_than: 1 } 
  validates :days_until_id, presence: true,  numericality: { other_than: 1 } 
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }

end
