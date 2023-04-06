class Product < ApplicationRecord
  paginates_per 10
  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true

  has_one_attached :image
end
